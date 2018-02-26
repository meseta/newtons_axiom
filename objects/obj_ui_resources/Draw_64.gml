/// @description 

draw_set_color(c_gray);
draw_set_font(fnt_ui);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(120, window_get_height()-12, "Metals: " + string(max(0, floor(ds_map_find_value(global.game_data, "metals")))));
draw_text(240, window_get_height()-12, "Parts: " + string(max(0, floor(ds_map_find_value(global.game_data, "parts")))));