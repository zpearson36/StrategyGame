/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < array_length(developments); i++)
{
	developments[i].tile = self
}

if(mouse_x > x_pos and mouse_y > y_pos
   and mouse_x < x_pos + WORLDTILEWIDTH
   and mouse_y < y_pos + WORLDTILEHEIGHT) hover = true