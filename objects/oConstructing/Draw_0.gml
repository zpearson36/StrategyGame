/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
draw_circle(x+(WORLDTILEWIDTH / 2),y+(WORLDTILEHEIGHT / 2), (WORLDTILEHEIGHT / 2) * (percentage_complete / 100), false)
if(percentage_complete == 0) draw_circle(x + (WORLDTILEWIDTH / 2),y + (WORLDTILEHEIGHT / 2), (WORLDTILEHEIGHT / 2), true)
if(percentage_complete == 0) draw_text(x+(WORLDTILEWIDTH / 2), y, resource.amount)
draw_set_color(c_white)
