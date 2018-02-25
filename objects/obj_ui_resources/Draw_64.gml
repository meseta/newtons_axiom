/// @description 

draw_set_color(c_white);
draw_set_font(fnt_ui);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(5, 5, "Metals: " + string(max(0, ds_map_find_value(global.game_data, "metals"))));
draw_text(128, 5, "Parts: " + string(max(0, ds_map_find_value(global.game_data, "parts"))));