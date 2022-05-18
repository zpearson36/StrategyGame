// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Main Buttons
function select_development(button)
{
	oGame.development = button.development
}

function place_development(object, tile)
{
	var tmp = instance_create_layer(0, 0, "Developments", object)
	tmp.tile = tile
	tile.add_development(tmp, tmp.need_resource)
}

function endturn(button)
{
	if(oGame.turn_speed == -1) oGame.turn_phase = TURNPHASE.END
}

function t_speed(button)
{
	switch(oGame.turn_speed)
	{
		case -1:
		{
			oGame.turn_speed = 180
			oGame.alarm[0] = 1
            button.text = "Turn Speed: 1"
			break;
		}
		case 180:
		{
			oGame.turn_speed = 120
			if(oGame.alarm[0] > 120) oGame.alarm[0] = 120
            button.text = "Turn Speed: 2"
			break;
		}
		case 120:
		{
			oGame.turn_speed = 60
			if(oGame.alarm[0] > 60) oGame.alarm[0] = 60
            button.text = "Turn Speed: 3"
			break;
		}
		case 60:
		{
			oGame.turn_speed = 30
			if(oGame.alarm[0] > 30) oGame.alarm[0] = 30
            button.text = "Turn Speed: 4"
			break;
		}
		case 30:
		{
			oGame.turn_speed = -1
			oGame.alarm[0] = -1
            button.text = "Turn Speed: 0"
			break;
		}
	}
}

//Tile Buttons
function display_developments(button)
{
	var dev_array = oGame.selected_tile.developments
	for(var i = 0; i < array_length(dev_array); i++)
	{
		var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
		tmp_btn.text = dev_array[i].name
		tmp_btn.height = 50
		array_push(oGame.gui.tile_details_array, tmp_btn)
	}
}

function display_units(button)
{
	var unit_array = oGame.selected_tile.units
	for(var i = 0; i < array_length(unit_array); i++)
	{
		var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
		tmp_btn.text = unit_array[i].name
		tmp_btn.height = 50
		tmp_btn.action = show_assignments
		tmp_btn.unit = unit_array[i]
		array_push(oGame.gui.tile_details_array, tmp_btn)
	}
}

//unit buttons
function show_assignments(button)
{
	var loading = "None"
	if(button.unit.loading_loc != undefined) loading = button.unit.loading_loc.name
	
	var unloading = "None"
	if(button.unit.delivery_loc != undefined) unloading = button.unit.delivery_loc.name
	
	var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
	tmp_btn.text = "Loading Location: " + loading
	tmp_btn.action = show_extractors
	tmp_btn.unit = button.unit
	array_push(oGame.gui.trans_assignments, tmp_btn)
	
	var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
	tmp_btn.text = "Delivery Location: " + unloading
	tmp_btn.action = show_factory
	tmp_btn.unit = button.unit
	array_push(oGame.gui.trans_assignments, tmp_btn)
}

function show_extractors(button)
{
	with(oExtractor)
	{
		var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
		tmp_btn.text = name
		tmp_btn.development = self
	    tmp_btn.unit = button.unit
		tmp_btn.action = set_loading
		tmp_btn.previous_button = button
		array_push(oGame.gui.destination_array, tmp_btn)
	}
}
function show_factory(button)
{
	with(oFactory)
	{
		var tmp_btn = instance_create_layer(x, y, "GUI", oGuiButton)
		tmp_btn.text = name
		tmp_btn.development = self
	    tmp_btn.unit = button.unit
		tmp_btn.action = set_dropoff
		tmp_btn.previous_button = button
		array_push(oGame.gui.destination_array, tmp_btn)
	}
}

function set_loading(button)
{
	button.unit.loading_loc = button.development
	button.previous_button.text = "Loading Location: " + button.development.name
	for(var i = 0; i < array_length(oGame.gui.destination_array); i++)
	{
		instance_destroy(oGame.gui.destination_array[i])
	}
	oGame.gui.destination_array = []
}

function set_dropoff(button)
{
	button.unit.delivery_loc = button.development
	button.previous_button.text = "Delivery Location: " + button.development.name
	for(var i = 0; i < array_length(oGame.gui.destination_array); i++)
	{
		instance_destroy(oGame.gui.destination_array[i])
	}
	oGame.gui.destination_array = []
}