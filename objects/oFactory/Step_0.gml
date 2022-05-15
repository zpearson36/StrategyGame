/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case FACTORYSTATES.IDLE:
	{
		if(resource.amount > global.unit_cost[? product])
		{
			resource.extract(global.unit_cost[? product])
			state = FACTORYSTATES.BUILDING
		}
		break;
	}
	case FACTORYSTATES.BUILDING:
	{
		if(build_progress >= 100)
		{
			tile.add_unit(instance_create_layer(x, y, "Units", product))
			build_progress = 0
			state = FACTORYSTATES.IDLE
		}
		break;
	}
}
show_debug_message(tile.units)