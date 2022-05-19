/// @description Insert description here
// You can write your code in this editor
name = "Construction" + string(instance_number(oExtractor))
tile = undefined
development = undefined
percentage_complete = 0
need_resource = false
resource_type = undefined
resource = new Resource(RESOURSETYPES.IRON, 0)
max_resource = undefined
requirements_met = false
function build(build_speed)
{
	if(requirements_met) percentage_complete += build_speed
}

function get_percentage_complete()
{
	return percentage_complete
}