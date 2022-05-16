// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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