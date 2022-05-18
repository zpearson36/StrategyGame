/// @description Insert description here
// You can write your code in this editor
var tmp_resource = RESOURSETYPES.NONE
var amount = 0
if(irandom(99) + 1 > 75){tmp_resource = RESOURSETYPES.IRON; amount = 10000}
resource = new Resource(tmp_resource, amount)
c_color = c_white
if(resource.type == RESOURSETYPES.IRON) c_color = c_grey
hover = false
x_pos = 0
y_pos = 0
developments = ds_map_create()
units = []
function add_development(dev, resource_dependent)
{
	if(resource_dependent)
	{
		if(dev.resource_type == resource.type) developments[? dev.name] = dev
		else instance_destroy(dev)
	}
	else
	{
		developments[? dev.name] = dev
	}
}

function add_unit(unit)
{
	array_push(units, unit)
}

function get_development()
{
	return get_developments_array()[0]
}

function remove_development(dev)
{
	ds_map_delete(developments, dev.name)
}

function get_developments_array()
{
	var tmp_array = []
	var name_array = []
	ds_map_keys_to_array(developments, name_array)
	for(var i = 0; i < array_length(name_array); i++)
	{
		array_push(tmp_array, developments[? name_array[i]])
	}
	return tmp_array
}

