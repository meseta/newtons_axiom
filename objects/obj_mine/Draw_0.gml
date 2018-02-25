/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(global.debug) {
	draw_set_color(c_blue);
	draw_set_font(fnt_ui);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, string(resource) + "/" + string(max_resource));
}