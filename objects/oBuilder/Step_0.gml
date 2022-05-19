/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case BUILDERSTATES.IDLE:
	{
		if(building == undefined) break
		if(building != undefined) state = BUILDERSTATES.MOVING
		break;
	}
	case BUILDERSTATES.MOVING:
	{
		if(building == undefined)
		{
			state = BUILDERSTATES.IDLE;
			break;
		}
		if(x == building.x and y == building.y)
		{
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