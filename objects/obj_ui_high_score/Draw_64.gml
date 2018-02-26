/// @description 

draw_set_color(c_white);
draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(xx, yy, "High score: " + string(floor(global.highscore)));
