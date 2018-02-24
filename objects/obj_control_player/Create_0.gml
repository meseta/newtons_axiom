/// @description Insert description here
// You can write your code in this editor

control_target = noone

last_mouse_timeout = 0;
last_mouse_x = mouse_x;
last_mouse_y = mouse_y;

camera_w = camera_get_view_width(view_camera[0])
camera_h = camera_get_view_height(view_camera[0])
base_aspect = camera_w/camera_h;
global.screenshake = 0;
camera_speed = 0.05;