/// @description Insert description here
// You can write your code in this editor

switch(state)
{
	case WORKERSTATES.IDLE:
	{
		if(refuling_station != undefined)
		{
			if(job != undefined)
			{
				switch(job.object_index)
				{
					case oTransporter:
					{
						job_info[0] = job.loading_loc
						job_info[1] = job.delivery_loc
						break;
					}
					case oBuilder:
					{
						job_info[0] = job.building
						break;
					}
				}
			}
			state = WORKERSTATES.REFULING;
			break;
		}
		if(destination == undefined) break;
		if(x != destination.x or y != destination.y){state = WORKERSTATES.MOVING; break;}
		if(job != undefined)
		{
			
			state = WORKERSTATES.WORKING;
			if(array_length(job_info) > 0)
			{
				show_debug_message(job_info)
				switch(job.object_index)
				{
					case oTransporter:
					{
						job.loading_loc  = job_info[0]
						job.delivery_loc = job_info[1]
						break;
					}
					case oBuilder:
					{
						job.building = job_info[0]
						break;
					}
				}
				job.piloted = true
				job_info = []
			}
			break;
		}
		break;
	}
	case WORKERSTATES.MOVING:
	{
		if(fuel.amount < refuling_threshold)
		{
			state = WORKERSTATES.IDLE;
			break;
		}
		if(destination == undefined)
		{
			state = WORKERSTATES.IDLE;
			break;
		}
		if(x == destination.x and y == destination.y)
		{
			destination = undefined
			state = WORKERSTATES.IDLE;
		}
		break;
	}
	case WORKERSTATES.WORKING:
	{
		if(fuel.amount < refuling_threshold)
		{
			state = WORKERSTATES.IDLE;
			break;
		}
		if(job == undefined){ state = WORKERSTATES.IDLE; break;}
		if(not job.piloted){ state = WORKERSTATES.IDLE; break;}
		
		break;
	}
	case WORKERSTATES.REFULING:
	{
		break;
	}
}