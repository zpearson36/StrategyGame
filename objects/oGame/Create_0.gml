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
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.development = oExtractor
tmp_btn.action = select_development
array_push(gui.button_array, tmp_btn)
var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
tmp_btn.action = endturn
array_push(gui.button_array, tmp_btn)