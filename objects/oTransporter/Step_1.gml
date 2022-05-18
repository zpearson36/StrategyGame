/// @description Insert description here
// You can write your code in this editor
tile = oGame.worldmap.world_grid[# floor(x / WORLDTILEWIDTH), floor(y / WORLDTILEHEIGHT)]
tile.add_unit(self)
var tmp_array = []
ds_map_keys_to_array(contents, tmp_array)
total_contents = 0
for(var i = 0; i < array_length(tmp_array); i++)
{
	total_contents += contents[? tmp_array[i]].amount
}
if(destination != loading_loc and destination != delivery_loc) destination = undefined