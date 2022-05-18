/// @description Insert description here
// You can write your code in this editor

if(percentage_complete >= 100)
{
	var tmp = instance_create_layer(0, 0, "Developments", development)
	tmp.tile = tile
	tile.add_development(tmp, tmp.need_resource)
	tile.remove_development(self)
	instance_destroy()
}