/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case GUISTATES.MAIN:
	{
		for(var i = 0; i < array_length(main_button_array); i++)
		{
			var tmp_bttn = main_button_array[i]
			tmp_bttn.y_pos = 50 + (i * (tmp_bttn.height + 10))
			tmp_bttn.state = BUTTONSTATES.ACTIVE
		}
		break;
	}
	case GUISTATES.TILE:
	{
		for(var i = 0; i < array_length(tile_button_array); i++)
		{
			var tmp_bttn = tile_button_array[i]
			tmp_bttn.y_pos = 50 + (i * (tmp_bttn.height + 10))
			tmp_bttn.state = BUTTONSTATES.ACTIVE
		}
		break;
	}
	case GUISTATES.TILEDETAILS:
	{
		for(var i = 0; i < array_length(tile_details_array); i++)
		{
			var tmp_bttn = tile_details_array[i]
			tmp_bttn.y_pos = 50 + (i * (tmp_bttn.height + 10))
			tmp_bttn.state = BUTTONSTATES.ACTIVE
		}
		break;
	}
	case GUISTATES.TRANSPORTSELECTION:
	{
		for(var i = 0; i < array_length(trans_assignments); i++)
		{
			var tmp_bttn = trans_assignments[i]
			tmp_bttn.y_pos = 50 + (i * (tmp_bttn.height + 10))
			tmp_bttn.state = BUTTONSTATES.ACTIVE
		}
		oGame.selected_unit = tmp_bttn.unit
		break;
	}
	case GUISTATES.TRANSDESTSELECTION:
	{
		for(var i = 0; i < array_length(destination_array); i++)
		{
			var tmp_bttn = destination_array[i]
			tmp_bttn.y_pos = 50 + (i * (tmp_bttn.height + 10))
			tmp_bttn.state = BUTTONSTATES.ACTIVE
		}
		break;
	}
}