/// @description Insert description here
// You can write your code in this editor
name = "Worker"  + string(instance_number(oWorker))
tile = undefined
current_job = undefined
job_map = ds_map_create()
job_map[? "Transport"] = oTransporter
job_map[? "Build"] = oBuilder

enum WORKERSTATES
{
	IDLE,
	MOVING,
	WORKING
}

state = WORKERSTATES.IDLE

function set_job(job_type)
{
	current_job = instance_create_layer(x, y, "Units", job_map[? job_type])
	current_job.worker = self
}

function remove_job()
{
	var tmp_job = current_job
	current_job = undefined
	instance_destroy(tmp_job)
}

function turn()
{
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
	}
}