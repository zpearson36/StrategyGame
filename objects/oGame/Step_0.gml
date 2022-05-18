/// @description Insert description here
// You can write your code in this editor
switch(turn_phase)
{
	case TURNPHASE.BEGINNING:
	{
		alarm[0] = turn_speed
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
				if(selected_tile != undefined)
				{
					//tile buttons
					var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
					tmp_btn.action = display_developments
					tmp_btn.text = "Developments"
					array_push(gui.tile_button_array, tmp_btn)
					var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
					tmp_btn.action = display_units
					tmp_btn.text = "units"
					array_push(gui.tile_button_array, tmp_btn)
					state = GAMESTATES.TILEMENU
					break;
				}
				break;
			}
			case GAMESTATES.PLACING:
			{
				if(mouse_check_button_pressed(mb_left))
				{
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
			case GAMESTATES.TILEMENU:
			{
				if(selected_tile == undefined)
				{
					state = GAMESTATES.IDLE
					gui.state = GUISTATES.MAIN
					break;
				}
				if(mouse_check_button_pressed(mb_right))
				{
					switch(gui.state)
					{
						case GUISTATES.TILE:
						{
							for(var i = 0; i < array_length(gui.tile_button_array); i++)
							{
								instance_destroy(gui.tile_button_array[i])
							}
							gui.tile_button_array = []
							selected_tile = undefined
							break;
						}
						case GUISTATES.TILEDETAILS:
						{
							for(var i = 0; i < array_length(gui.tile_details_array); i++)
							{
								instance_destroy(gui.tile_details_array[i])
							}
							gui.tile_details_array = []
							break;
						}
						case GUISTATES.TRANSPORTSELECTION:
						{
							for(var i = 0; i < array_length(gui.trans_assignments); i++)
							{
								instance_destroy(gui.trans_assignments[i])
							}
							gui.trans_assignments = []
							break;
						}
						case GUISTATES.TRANSDESTSELECTION:
						{
							for(var i = 0; i < array_length(gui.destination_array); i++)
							{
								instance_destroy(gui.destination_array[i])
							}
							gui.destination_array = []
							break;
						}
					}
				}
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
		with(oFactory)
		{
			turn()
		}
		with(oTransporter)
		{
			turn()
		}
		turn_phase = TURNPHASE.BEGINNING
		break;
	}
}