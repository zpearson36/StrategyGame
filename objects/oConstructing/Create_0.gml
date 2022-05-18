/// @description Insert description here
// You can write your code in this editor
name = "construction site"
tile = undefined
development = undefined
percentage_complete = 0
build_speed = 5
need_resource = false
function turn()
{
	percentage_complete += build_speed
}