/// @description Insert description here
// You can write your code in this editor
tile = oGame.worldmap.world_grid[# floor(x / WORLDTILEWIDTH), floor(y / WORLDTILEHEIGHT)]
tile.add_unit(self)
if(building != undefined) destination = building