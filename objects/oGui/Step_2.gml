/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case GUISTATES.MAIN:
	{
		if(array_length(tile_button_array) != 0)
		{
			state = GUISTATES.TILE
		}
		break;
	}
	case GUISTATES.TILE:
	{
		if(array_length(tile_button_array) == 0)
		{
			state = GUISTATES.MAIN
		}
		if(array_length(tile_details_array) != 0)
		{
			state = GUISTATES.TILEDETAILS
		}
		break;
	}
	case GUISTATES.TILEDETAILS:
	{
		if(array_length(tile_details_array) == 0)
		{
			state = GUISTATES.MAIN
		}
		if(array_length(trans_assignments) != 0)
		{
			state = GUISTATES.TRANSPORTSELECTION
		}
		break;
	}
	case GUISTATES.TRANSPORTSELECTION:
	{
		if(array_length(trans_assignments) == 0)
		{
			state = GUISTATES.TILEDETAILS
		}
		if(array_length(destination_array) != 0)
		{
			state = GUISTATES.TRANSDESTSELECTION
		}
		break;
	}
	case GUISTATES.TRANSDESTSELECTION:
	{
		if(array_length(destination_array) == 0)
		{
			state = GUISTATES.TRANSPORTSELECTION
		}
		break;
	}
}