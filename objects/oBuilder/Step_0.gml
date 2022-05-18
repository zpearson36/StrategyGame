/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case BUILDERSTATES.IDLE:
	{
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
			state = BUILDERSTATES.IDLE;
		}
		break;
	}
	case BUILDERSTATES.BUILDING:
	{
		break;
	}
}