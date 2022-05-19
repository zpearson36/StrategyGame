#macro WORLDTILEWIDTH   64
#macro WORLDTILEHEIGHT  64
#macro WORLDMAPWIDTH    24//room_width / WORLDTILEWIDTH
#macro WORLDMAPHEIGHT   24//room_height / WORLDTILEHEIGHT

enum RESOURSETYPES
{
	NONE,
	IRON
}

enum UNITTYPES
{
	TRANSPORTER,
	BUILDER
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

global.unit_cost = ds_map_create()
global.unit_cost[? oTransporter] = 100
global.unit_cost[? oBuilder] = 100

global.development_cost = ds_map_create()
global.development_cost[? oExtractor] = 100
global.development_cost[? oFactory] = 100
global.development_cost[? oBuilderFactory] = 100