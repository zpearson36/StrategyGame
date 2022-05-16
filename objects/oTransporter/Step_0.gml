/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case TRANSPORTSTATES.IDLE:
	{
		if(destination == undefined) break;
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
		if(x == destination.x and y == destination.y)
		{
			state = TRANSPORTSTATES.IDLE;
		}
		break;
	}
	case TRANSPORTSTATES.LOADING:
	{
		if(total_contents >= max_capacity)
		{
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
show_debug_message(x)
show_debug_message(y)