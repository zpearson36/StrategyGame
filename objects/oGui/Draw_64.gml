/// @description Insert description here
// You can write your code in this editor
with(oWorldMapTile)
{
	if(hover)
	{
		for(var i = 0; i < array_length(developments); i++)
		{
		    draw_text(room_width - 500, room_height - 100 + i*25, developments[i].name)
		}
		for(var i = 0; i < array_length(units); i++)
		{
		    draw_text(room_width - 300, room_height - 100 + i*25, units[i].name)
		}
	}
}