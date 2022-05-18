/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case TRANSPORTSTATES.IDLE:
	{
		if(destination == undefined)
		{
			if(total_contents == 0 and loading_loc != undefined)
			{
				destination = loading_loc
				break;
			}
			if(total_contents != 0 and delivery_loc != undefined)
			{
				destination = delivery_loc
				break;
			}
			break;
		}
		if(x != destination.x or y != destination.y)
		{
			state = TRANSPORTSTATES.MOVING
			break;
		}
		if(loading_loc == destination)
		{
			state = TRANSPORTSTATES.LOADING
			break;
		}
		if(delivery_loc == destination)
		{
			state = TRANSPORTSTATES.UNLOADING
			break;
		}
		break;
	}
	case TRANSPORTSTATES.MOVING:
	{
		if(destination == undefined)
		{
			state = TRANSPORTSTATES.IDLE;
			break;
		}
		if(x == destination.x and y == destination.y)
		{
			state = TRANSPORTSTATES.IDLE;
		}
		break;
	}
	case TRANSPORTSTATES.LOADING:
	{
		if(total_contents >= max_capacity or destination.resource.amount == 0)
		{
			if(destination.resource.amount == 0) loading_loc = undefined
			state = TRANSPORTSTATES.IDLE;
			destination = delivery_loc
			break;
		}
		break;
	}
	case TRANSPORTSTATES.UNLOADING:
	{
		if(total_contents == 0)
		{
			state = TRANSPORTSTATES.IDLE;
			destination = loading_loc
			break;
		}
		break;
	}
}