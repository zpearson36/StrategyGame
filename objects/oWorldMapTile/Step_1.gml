/// @description Insert description here
// You can write your code in this editor
x = x_pos
y = y_pos
var tmp_array = get_developments_array()
for(var i = 0; i < array_length(tmp_array); i++)
{
	tmp_array[i].tile = self
}

if(mouse_x > x_pos and mouse_y > y_pos
   and mouse_x < x_pos + WORLDTILEWIDTH
   and mouse_y < y_pos + WORLDTILEHEIGHT) hover = true