/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case WORKERSTATES.IDLE:
	{
		if(current_job != undefined) state = WORKERSTATES.WORKING
		break;
	}
	case WORKERSTATES.MOVING:
	{
		if(destination == undefined)
		{
			state = WORKERSTATES.IDLE;
			break;
		}
		if(x == destination.x and y == destination.y)
		{
			state = WORKERSTATES.IDLE;
		}
		break;
	}
	case WORKERSTATES.WORKING:
	{
		if(current_job == undefined) state = WORKERSTATES.IDLE
		break;
	}
}