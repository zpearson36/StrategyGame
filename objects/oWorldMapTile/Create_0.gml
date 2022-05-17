/// @description Insert description here
// You can write your code in this editor
var tmp_resource = RESOURSETYPES.NONE
var amount = 0
if(irandom(99) + 1 > 75){tmp_resource = RESOURSETYPES.IRON; amount = 1000}
resource = new Resource(tmp_resource, amount)
c_color = c_white
if(resource.type == RESOURSETYPES.IRON) c_color = c_grey
hover = false
x_pos = 0
y_pos = 0
developments = []
units = []
function add_development(dev, resource_dependent)
{
	if(resource_dependent)
	{
		if(dev.resource_type == resource.type) array_push(developments, dev)
		else instance_destroy(dev)
	}
	else
	{
		array_push(developments, dev)
	}
	
}

function add_unit(unit)
{
	array_push(units, unit)
}

function get_development()
{
	return developments[0]
}