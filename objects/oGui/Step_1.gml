/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < array_length(button_array); i++)
{
	var tmp_bttn = button_array[i]
	tmp_bttn.y_pos = 50 + (i * (tmp_bttn.height + 10))
}