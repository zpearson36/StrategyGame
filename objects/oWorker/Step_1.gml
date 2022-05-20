/// @description Insert description here
// You can write your code in this editor

tile = oGame.worldmap.world_grid[# floor(x / WORLDTILEWIDTH), floor(y / WORLDTILEHEIGHT)]
tile.add_unit(self)
if(job != undefined) destination = job.tile

switch(state)
{
	case WORKERSTATES.IDLE:
	{
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