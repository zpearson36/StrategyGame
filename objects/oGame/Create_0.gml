/// @description Insert description here
// You can write your code in this editor
enum GAMESTATES
{
	IDLE,
	PLACING,
	TILEMENU,
	TILEDETAILS
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
selected_tile = undefined

worldmap = instance_create_layer(x, y, "utils", oWorldMap)
turn_speed = -1

//========GUI========
gui = instance_create_layer(x, y, "utils", oGui)
//main buttons
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.development = oExtractor
tmp_btn.action = select_development
tmp_btn.text = "Extractor"
array_push(gui.main_button_array, tmp_btn)
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.development = oFactory
tmp_btn.action = select_development
tmp_btn.text = "Factory"
array_push(gui.main_button_array, tmp_btn)
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.action = endturn
tmp_btn.text = "End Turn"
array_push(gui.main_button_array, tmp_btn)
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.action = t_speed
tmp_btn.text = "Turn Speed: 0"
array_push(gui.main_button_array, tmp_btn)

