/// @description Insert description here
// You can write your code in this editor
c_color_idle  = c_black
c_color_hover = c_grey
c_color = c_color_idle
x_pos = WORLDMAPWIDTH * WORLDTILEWIDTH + 50
y_pos = 0
width = 300
height = 125
hover = false
function tmp_func(){return -1}
action = tmp_func

development = undefined

enum BUTTONSTATES
{
	ACTIVE,
	INACTIVE
}

state = BUTTONSTATES.ACTIVE