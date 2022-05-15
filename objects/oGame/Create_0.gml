/// @description Insert description here
// You can write your code in this editor
enum GAMESTATES
{
	IDLE,
	PLACING
}

enum TURNPHASE
{
	BEGINNING,
	MAIN,
	END
}

turn_phase = TURNPHASE.BEGINNING
state = GAMESTATES.IDLE
development = undefined
gui = instance_create_layer(x, y, "utils", oGui)
worldmap = instance_create_layer(x, y, "utils", oWorldMap)
turn_speed = -1
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.development = oExtractor
tmp_btn.action = select_development
tmp_btn.text = "Extractor"
array_push(gui.button_array, tmp_btn)
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.action = endturn
tmp_btn.text = "End Turn"
array_push(gui.button_array, tmp_btn)
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.action = t_speed
tmp_btn.text = "Turn Speed: 0"
array_push(gui.button_array, tmp_btn)
