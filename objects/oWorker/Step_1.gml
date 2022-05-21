/// @description Insert description here
// You can write your code in this editor

tile = oGame.worldmap.world_grid[# floor(x / WORLDTILEWIDTH), floor(y / WORLDTILEHEIGHT)]
tile.add_unit(self)
if(job != undefined) destination = job.tile

switch(state)
{
	case WORKERSTATES.IDLE:
	{
		if(fuel.amount < refuling_threshold)
		{
			with(oDepot)
			{
				if(resource.amount > 0)
				{
					if(other.refuling_station == undefined) other.refuling_station = self
					if(point_distance(x, y, other.x, other.y) < point_distance(other.x, other.y, other.refuling_station.x, other.refuling_station.y)) other.refuling_station = self
				}
			}
			if(refuling_station == undefined)
			{
				with(oExtractor)
				{
					if(resource.amount > 0)
					{
						if(other.refuling_station == undefined) other.refuling_station = self
						if(point_distance(x, y, other.x, other.y) < point_distance(other.x, other.y, other.refuling_station.x, other.refuling_station.y)) other.refuling_station = self
					}
				}
			}
		}
		break;
	}
	case WORKERSTATES.MOVING:
	{
		break;
	}
	case WORKERSTATES.WORKING:
	{
		job.piloted = true
		x = job.x
		y = job.y
		break;
	}
}