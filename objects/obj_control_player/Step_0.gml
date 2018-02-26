/// @description Camera position

if(instance_exists(control_target)) {

	//Half view size
	var _vw = camera_get_view_width(view_camera[0]) / 2;
	var _vh = camera_get_view_height(view_camera[0]) / 2;
	
	//Look ahead
	var _maxAhead = 32;

	var _xTo = control_target.x + _maxAhead * control_target.hspd;
	var _yTo = control_target.y + _maxAhead * control_target.vspd;

	x += (_xTo-x)*camera_speed;
	y += (_yTo-y)*camera_speed;
	
	camera_set_view_pos(view_camera[0], x - _vw, y - _vh);
	
	layer_y("Background0", camera_get_view_y(view_camera[0])*0.9);
	layer_x("Background0", camera_get_view_x(view_camera[0])*0.9);
	layer_y("Background1", camera_get_view_y(view_camera[0])*0.5);
	layer_x("Background1", camera_get_view_x(view_camera[0])*0.5);
	
}