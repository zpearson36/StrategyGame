/// @description Insert description here
// You can write your code in this editor
name = "Builder"  + string(instance_number(oTransporter))
piloted = false
unit_type = UNITTYPES.BUILDER
tile = undefined
destination = undefined
contents = ds_map_create()
total_contents = 0
build_speed = 5
enum BUILDERSTATES
{
	IDLE,
	MOVING,
	BUILDING
}

state = BUILDERSTATES.IDLE
building = undefined

function turn()
{
	switch(state)
	{
		case BUILDERSTATES.MOVING:
		{
			var _x = floor(x / WORLDTILEWIDTH)
			var _y = floor(y / WORLDTILEHEIGHT)
			var _x2 = floor(x / WORLDTILEWIDTH) 
			var _y2 = floor(y / WORLDTILEHEIGHT) - 1
			var _xx = floor(destination.x / WORLDTILEWIDTH)
			var _yy = floor(destination.y / WORLDTILEHEIGHT)
			
			if(point_distance(_x - 1, _y, _xx, _yy) < point_distance(_x2, _y2, _xx, _yy)){_x2 = _x - 1; _y2 = _y;}
			if(point_distance(_x + 1, _y, _xx, _yy) < point_distance(_x2, _y2, _xx, _yy)){_x2 = _x + 1; _y2 = _y;}
			if(point_distance(_x, _y + 1, _xx, _yy) < point_distance(_x2, _y2, _xx, _yy)){_x2 = _x; _y2 = _y + 1;}
			x = _x2 * WORLDTILEWIDTH
			y = _y2 * WORLDTILEHEIGHT
			break;
		}
		case BUILDERSTATES.BUILDING:
		{
			if(building.requirements_met) building.build(build_speed)
			if(building.get_percentage_complete() >= 100) building = undefined
			break;
		}
	}
}