/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
draw_circle(x+31,y+31, 32 * (percentage_complete / 100), false)
if(percentage_complete == 0) draw_circle(x+31,y+31, 32, true)
draw_set_color(c_white)