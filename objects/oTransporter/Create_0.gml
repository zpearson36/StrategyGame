/// @description Insert description here
// You can write your code in this editor
tile = undefined
destination = undefined
loading_loc = undefined
delivery_loc = undefined
max_capacity = 100
contents = ds_map_create()
contents[? RESOURSETYPES.IRON] = new Resource(RESOURSETYPES.IRON, 0)
total_contents = 0
loading_speed = 5
with(oFactory)
{
	other.delivery_loc = self
}
with(oExtractor)
{
	other.loading_loc = self
}
destination = loading_loc
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
			var _y2 = floor(y / WORLDTILEHEIGHT)
			var _xx = floor(destination.x / WORLDTILEWIDTH)
			var _yy = floor(destination.y / WORLDTILEHEIGHT)
			for(var i = -1; i <= 1; i++)
			{
				for(var j = -1; j <= 1; j++)
				{
					if(i == 1 and j == 1) continue
					if(point_distance(_x + i, _y + j, _xx, _yy) < point_distance(_x2, _y2, _xx, _yy))
					{
						_x2 = _x + i
						_y2 = _y + j
					}
				}
			}
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