/// @description 

draw_set_color(c_white);
draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(xx, yy, "Your score: " + string(floor(global.myscore)));

if(floor(global.myscore) >= floor(global.highscore)) {
	draw_set_color(c_red);
	draw_text(xx, yy+24, "*** New High score! ***");
}
else {
	draw_text(xx, yy+24, "High score: " + string(floor(global.highscore)));
}