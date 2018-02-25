/// @description Insert description here
// You can write your code in this editor

if(global.cursor_ui or global.cursor_ship) {
	window_set_cursor(cr_handpoint);
}
else {
	window_set_cursor(cr_default);
}