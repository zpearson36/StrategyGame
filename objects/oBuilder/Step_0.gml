/// @description Insert description here
// You can write your code in this editor
if(piloted)
{
	switch(state)
	{
		case BUILDERSTATES.IDLE:
		{
			with(oConstructing)
			{
				if(x == other.x and y == other.y)
				{
					other.building = self
				}
			}
			if(destination != undefined){state = BUILDERSTATES.MOVING; break;}
			if(building == undefined) break
			break;
		}
		case BUILDERSTATES.MOVING:
		{
			if(destination == undefined)
			{
				state = BUILDERSTATES.IDLE;
				break;
			}
			if(x == destination.x and y == destination.y)
			{
				destination = undefined
				state = BUILDERSTATES.BUILDING;
			}
			break;
		}
		case BUILDERSTATES.BUILDING:
		{
			if(building == undefined) state = BUILDERSTATES.IDLE
			break;
		}
	}
}
else
{
	building = undefined
	state = BUILDERSTATES.IDLE
}