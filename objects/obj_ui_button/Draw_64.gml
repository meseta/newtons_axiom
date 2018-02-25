/// @description Insert description here
// You can write your code in this editor

draw_sprite(sprite_index, image_index, xx, yy);

// draw tooltip
if(tooltip_show and string_length(tooltip_text)) {
	draw_set_color(c_black);
	draw_rectangle(tooltip_x1, tooltip_y1, tooltip_x2, tooltip_y2, false)
	draw_set_color(c_ltgray);
	draw_rectangle(tooltip_x1, tooltip_y1, tooltip_x2, tooltip_y2, true)

	if(can_use) {
		draw_set_color(c_white);
	}
	else {
		draw_set_color(c_red);	
	}
	draw_set_font(fnt_ui);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(tooltip_x1+5, tooltip_y1+5, tooltip_text);
	
	draw_set_color(c_white);
}
