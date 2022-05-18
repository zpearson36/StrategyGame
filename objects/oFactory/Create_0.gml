/// @description Insert description here
// You can write your code in this editor
name = "Factory" + string(instance_number(oFactory))
need_resource = false
tile = undefined
build_speed = 10
resource = new Resource(RESOURSETYPES.IRON, 100)
enum FACTORYSTATES
{
	IDLE,
	BUILDING
}

state =  FACTORYSTATES.IDLE
product = oTransporter
build_progress = 0

function turn()
{
	if(state == FACTORYSTATES.BUILDING) build_progress += build_speed
}