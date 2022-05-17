/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case BUTTONSTATES.ACTIVE:
	{
		if(mouse_x > x_pos and mouse_y > y_pos
		   and mouse_x < x_pos + width
		   and mouse_y < y_pos + height) hover = true
		if(hover)
		{
			if(mouse_check_button_pressed(mb_left))
			{
				script_execute(action, self)
			}
		}
		break;
	}
	case BUTTONSTATES.INACTIVE:
	{
		break;
	}
}
