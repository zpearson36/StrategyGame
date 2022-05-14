/// @description Insert description here
// You can write your code in this editor
c_color = c_color_idle
if(hover) c_color = c_color_hover
draw_rectangle_color(x_pos, y_pos, x_pos + width, y_pos + height, c_color, c_color, c_color, c_color, false)
if(development != undefined) draw_sprite(object_get_sprite(development), -1, x_pos + 10, y_pos + 10,)