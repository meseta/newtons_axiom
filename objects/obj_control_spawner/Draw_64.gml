/// @description Insert description here
// You can write your code in this editor

if(global.debug) {
	draw_set_color(c_white);
	draw_set_font(fnt_ui);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(window_get_width()-5, 5, "Block x:" + string(block_x) + " y:" + string(block_y));
}