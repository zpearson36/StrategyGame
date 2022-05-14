// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function select_development(button)
{
	oGame.development = button.development
}

function place_development(object, tile)
{
	show_debug_message(tile)
	tile.add_development(instance_create_layer(0, 0, "Developments", object))
}