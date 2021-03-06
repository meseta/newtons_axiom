/// @description mouse stuff

var x1 = xx+camera_get_view_x(view_camera[0])-sprite_xoffset;
var y1 = yy+camera_get_view_y(view_camera[0])-sprite_yoffset;

// mouse stuff
var mx = mouse_x-view_xport[0];
var my = mouse_y-view_yport[0];

if(point_in_rectangle(mx, my, x1, y1, x1+sprite_width, y1+sprite_height)) {
	global.cursor_ui = true;
	tooltip_show = true;
	can_use = (check_script == noone) or script_execute(check_script, action_argument);
	
	if(mouse_check_button(mb_left)) {
		if(can_use) {
			image_index = 1;
		}
	}
	else {
		image_index = 0;	
	}
	
	if(mouse_check_button_released(mb_left)) {
		if(action_script != noone and can_use) {
			script_execute(action_script, action_argument);
		}
	}
}
else {
	image_index = 0;
	tooltip_show = false;
}