/// @description Insert description here
// You can write your code in this editor
switch(turn_phase)
{
	case TURNPHASE.BEGINNING:
	{
		turn_phase = TURNPHASE.MAIN
		break;
	}
	case TURNPHASE.MAIN:
	{
		switch(state)
		{
			case GAMESTATES.IDLE:
			{
				if(development != undefined)
				{
					state = GAMESTATES.PLACING
					break;
				}
				break;
			}
			case GAMESTATES.PLACING:
			{
				if(mouse_check_button_pressed(mb_left))
				{
					show_debug_message(floor(mouse_x / WORLDTILEWIDTH))
					show_debug_message(floor(mouse_y / WORLDTILEHEIGHT))
					var tmp_tile = worldmap.get_tile(
					                  floor(mouse_x / WORLDTILEWIDTH),
					                  floor(mouse_y / WORLDTILEHEIGHT)
									  )
					place_development(development, tmp_tile)
					development = undefined
				}
				if(mouse_check_button_pressed(mb_right))
				{
					development = undefined
				}
				if(development == undefined) state = GAMESTATES.IDLE
				break;
			}
		}
		break;
	}
	case TURNPHASE.END:
	{
		with(oExtractor)
		{
			resource.collect(tile.resource.extract(extraction_amount))
		}
		turn_phase = TURNPHASE.BEGINNING
		break;
	}
}