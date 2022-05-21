/// @description Insert description here
// You can write your code in this editor
name = "Worker"  + string(instance_number(oWorker))
unit_type = UNITTYPES.WORKER
tile = undefined
job = undefined
job_info = []
destination = undefined
fuel = new Resource(RESOURSETYPES.IRON, 100)
fuel_consumption_rate = 1
max_fuel = 100
refuling_station = undefined
refuling_threshold = 15
enum WORKERSTATES
{
	IDLE,
	MOVING,
	WORKING,
	REFULING
}

state = WORKERSTATES.IDLE
function turn()
{
	fuel.extract(1)
	switch(state)
	{
		case WORKERSTATES.MOVING:
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
		case WORKERSTATES.WORKING:
		{
			break;
		}
		case WORKERSTATES.REFULING:
		{
			if(x != refuling_station.x or y != refuling_station.y)
			{
				var _x = floor(x / WORLDTILEWIDTH)
				var _y = floor(y / WORLDTILEHEIGHT)
				var _x2 = floor(x / WORLDTILEWIDTH) 
				var _y2 = floor(y / WORLDTILEHEIGHT) - 1
				var _xx = floor(refuling_station.x / WORLDTILEWIDTH)
				var _yy = floor(refuling_station.y / WORLDTILEHEIGHT)
			
				if(point_distance(_x - 1, _y, _xx, _yy) < point_distance(_x2, _y2, _xx, _yy)){_x2 = _x - 1; _y2 = _y;}
				if(point_distance(_x + 1, _y, _xx, _yy) < point_distance(_x2, _y2, _xx, _yy)){_x2 = _x + 1; _y2 = _y;}
				if(point_distance(_x, _y + 1, _xx, _yy) < point_distance(_x2, _y2, _xx, _yy)){_x2 = _x; _y2 = _y + 1;}
				x = _x2 * WORLDTILEWIDTH
				y = _y2 * WORLDTILEHEIGHT
				break;
			}
			var tmp = refuling_station.resource.extract(5)
			fuel.collect(tmp)
			if(tmp < 5 or fuel.amount >= 95)
			{
				state = WORKERSTATES.IDLE
				refuling_station = undefined
			}
			break;
		}
	}
}