/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case GAMESTATES.IDLE:
	{
		break;
	}
	case GAMESTATES.PLACING:
	{
		draw_sprite(object_get_sprite(development), -1, mouse_x, mouse_y)
		break;
	}
}