/// @description Insert description here
// You can write your code in this editor


var max_range = 600;
var closest_target = noone;
var closest_range = 0;
	
var xvect = 0;
var yvect = 0;
	
with(obj_spacecraft) { // cycle through big ships
	var range = distance_to_object(other);
	if(faction != other.faction and range < max_range) {
		if(closest_target == noone or range < closest_range) {
			closest_target = id;
			closest_range = range;
		}
	}
}

if(closest_target == noone and faction == FACTIONS.player) { // second priority target asteroids
	with(obj_asteroid) { // cycle through ships
		var range = distance_to_object(other);
		if(not object_is_ancestor(object_index, obj_mine) and range < max_range) { // effective range for asteroids
			if(closest_target == noone or range < closest_range) {
				closest_target = id;
				closest_range = range;
			}
		}
	}
}
	
if(instance_exists(closest_target)) { // rotate towards it
	var angle_to_target = point_direction(x, y, closest_target.x, closest_target.y);
	var dtheta = angle_difference(angle_to_target, aim_dir);
	aim_dir += clamp(dtheta, -rotate_rate, rotate_rate);
}

add_hspd *= 0.9;
add_vspd *= 0.9;

// Inherit the parent event
event_inherited();

