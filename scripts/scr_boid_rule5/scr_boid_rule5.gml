// keep away from obstacles

var vector = argument0;
var weight = argument1;

if(mining_speed > 0 and instance_exists(obj_control_player.control_target)) {
	
	var max_range_to_player = 150;
	
	var closest_inst = noone;
	var closest_range = 0;

	with(obj_mine) { // fetch all mines and select closesst with resources
		if(resource > 0) {
			var range = distance_to_object(obj_control_player.control_target);
			if(range < max_range_to_player) {
				if(closest_inst == noone or range < closest_range) {
					closest_inst = id;
					closest_range = range;
				}
			}
		}
	}
	
	if(closest_inst != noone) {
		var dir = point_direction(x, y, closest_inst.x, closest_inst.y);
		closest_range *= closest_range/max_range_to_player; // square to reduce thrust at close range
		var xvect = lengthdir_x(closest_range, dir);
		var yvect = lengthdir_y(closest_range, dir);
		vector[| 0] += xvect * weight;
		vector[| 1] += yvect * weight;
	}
}