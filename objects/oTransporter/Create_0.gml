/// @description Insert description here
// You can write your code in this editor
name = "Transporter"  + string(instance_number(oTransporter))
piloted = false
unit_type = UNITTYPES.TRANSPORTER
tile = undefined
destination = undefined
loading_loc = undefined
delivery_loc = undefined
max_capacity = 100
contents = ds_map_create()
contents[? RESOURSETYPES.IRON] = new Resource(RESOURSETYPES.IRON, 0)
total_contents = 0
loading_speed = 5
enum TRANSPORTSTATES
{
	IDLE,
	MOVING,
	LOADING,
	UNLOADING
}

state = TRANSPORTSTATES.IDLE

function turn()
{
	switch(state)
	{
		case TRANSPORTSTATES.MOVING:
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
		case TRANSPORTSTATES.LOADING:
		{
			var development = tile.get_development()
			var res = contents[? development.resource.type]
			res.collect(development.resource.extract(loading_speed))
			break;
		}
		case TRANSPORTSTATES.UNLOADING:
		{
			var development = tile.get_development()
			var res = contents[? development.resource.type]
			development.resource.collect(res.extract(loading_speed))
			break;
		}
	}
}