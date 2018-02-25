/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

xx = x;
yy = y;

toggle = false;
tooltip_show = false;
if(not variable_instance_exists(id, "tooltip_text")) {
	tooltip_text = ""
}

draw_set_font(fnt_ui);
var tooltip_width = string_width(tooltip_text);
var tooltip_height = string_height(tooltip_text);
tooltip_x1 = xx - tooltip_width/2 - 5;
tooltip_y1 = yy - tooltip_height/2 - 5 - sprite_yoffset - 14;
tooltip_x2 = xx + tooltip_width/2 + 5;
tooltip_y2 = yy + tooltip_height/2 + 5 - sprite_yoffset - 14;


