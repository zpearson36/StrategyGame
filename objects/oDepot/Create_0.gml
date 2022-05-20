/// @description Insert description here
// You can write your code in this editor
name = "Depot" + string(instance_number(oDepot))
need_resource = false
tile = undefined
max_capacity = 10000
//contents = ds_map_create()
resource = new Resource(RESOURSETYPES.IRON, 100)
total_contents = 0