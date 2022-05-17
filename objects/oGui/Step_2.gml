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
		break;
	}
}