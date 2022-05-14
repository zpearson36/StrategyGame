/// @description Insert description here
// You can write your code in this editor
if(hover)
{
	draw_set_alpha(.5)
	draw_rectangle_color(
	    WORLDTILEWIDTH * floor(x_pos / WORLDTILEWIDTH),
		WORLDTILEHEIGHT * floor(y_pos / WORLDTILEHEIGHT),
		WORLDTILEWIDTH * floor(x_pos / WORLDTILEWIDTH) + WORLDTILEWIDTH,
		WORLDTILEHEIGHT * floor(y_pos / WORLDTILEHEIGHT) + WORLDTILEHEIGHT,
		c_green, c_green, c_green, c_green, false)
	draw_set_alpha(1)
}