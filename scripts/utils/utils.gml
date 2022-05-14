#macro WORLDTILEWIDTH   64
#macro WORLDTILEHEIGHT  64
#macro WORLDMAPWIDTH    12//room_width / WORLDTILEWIDTH
#macro WORLDMAPHEIGHT   12//room_height / WORLDTILEHEIGHT

enum RESOURSETYPES
{
	NONE,
	IRON
}

function Resource(_type = RESOURSETYPES.NONE, _amount = 0) constructor
{
	type = _type
	amount = _amount
	
	static extract = function(ex_amount)
	{
		if(ex_amount > amount) ex_amount = amount
		amount -= ex_amount
		return ex_amount
	}
	
	static collect = function(add_amount)
	{
		amount += add_amount
	}
}