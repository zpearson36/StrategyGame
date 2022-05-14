/// @description Insert description here
// You can write your code in this editor
world_grid = ds_grid_create(WORLDMAPWIDTH, WORLDMAPHEIGHT)

for(var i = 0; i < WORLDMAPWIDTH; i++)
{
	for(var j = 0; j < WORLDMAPHEIGHT; j++)
	{
		var tmp_tile = instance_create_layer(x, y, "Tiles", oWorldMapTile)
		tmp_tile.x_pos = WORLDTILEWIDTH * i
		tmp_tile.y_pos = WORLDTILEHEIGHT * j
		world_grid[# i, j] = tmp_tile
	}
}

function get_tile(_x, _y)
{
	return world_grid[# _x, _y]
}