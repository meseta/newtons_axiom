/// @description Insert description here
// You can write your code in this editor


if(obj_control_player.control_target == id and weapon != noone) {
	// draw targeting reticule	
	draw_sprite_ext(spr_reticule, floor(sprite_timer/4) % sprite_get_number(spr_reticule), x, y, 1, 1, aim_dir, c_white, 0.5);
}

var xx = x;
var yy = y;
if(unit_shake > 0) {
	xx += random_range(-unit_shake, unit_shake);
	yy += random_range(-unit_shake, unit_shake);
	unit_shake -= 1;
}

draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale, image_angle, c_white, 1.0);

if(turret != noone) {
	draw_sprite_ext(turret, 0, xx, yy, image_xscale, image_yscale, aim_dir, c_white, 1.0);
}

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