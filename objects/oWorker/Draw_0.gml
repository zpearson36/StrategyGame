/// @description Insert description here
// You can write your code in this editor
if(tile != undefined)
{
	if(array_length(tile.get_developments_array()) == 0 and state != WORKERSTATES.WORKING) draw_sprite_ext(sprite_index, -1, x, y, WORLDTILEWIDTH / sprite_width, WORLDTILEHEIGHT / sprite_height, 0, c_white, 1)
}