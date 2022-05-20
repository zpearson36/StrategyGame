/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case WORKERSTATES.IDLE:
	{
		if(destination == undefined) break;
		if(x != destination.x or y != destination.y){state = WORKERSTATES.MOVING; break;}
		if(job != undefined){state = WORKERSTATES.WORKING; break;}
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
			destination = undefined
			state = WORKERSTATES.IDLE;
		}
		break;
	}
	case WORKERSTATES.WORKING:
	{
		if(job == undefined){ state = WORKERSTATES.IDLE; break;}
		if(not job.piloted){ state = WORKERSTATES.IDLE; break;}
		
		break;
	}
}