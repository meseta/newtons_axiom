/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1.0);

if(global.debug) {
	// draw HP
	draw_set_color(c_red);
	draw_set_font(fnt_ui);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, string(hp) + "/" + string(max_hp));
	
	// draw mining circle
	if(mining_speed > 0) {
		draw_set_color(c_blue);
		draw_circle(x, y, max(16, bbox_right-bbox_left), true);	
	}
}