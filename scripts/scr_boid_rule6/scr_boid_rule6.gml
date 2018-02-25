// keep away from obstacles

var vector = argument0;
var weight = argument1;

if(weapon != noone) {
	// select nearest opposing
	var max_range_hostile = 500;
	var max_range_asteroid = 300;
	var max_range_disengage = 500;
	
	var closest_target = noone;
	var closest_range = 0;
	
	var xvect = 0;
	var yvect = 0;
	
	with(obj_spacecraft) { // cycle through ships
		var range = distance_to_object(other);
		if(faction != other.faction and range < max_range_hostile) {
			if(closest_target == noone or range < closest_range) {
				closest_target = id;
				closest_range = range;
			}
		}
	}
	
	if(closest_target == noone and faction == FACTIONS.player) { // second priority target asteroids
		with(obj_asteroid) { // cycle through ships
			var range = distance_to_object(other);
			if(not object_is_ancestor(object_index, obj_mine) and range < max_range_asteroid) { // effective range for asteroids
				if(closest_target == noone or range < closest_range) {
					closest_target = id;
					closest_range = range;
				}
			}
		}
	}
	
	if(instance_exists(closest_target)) { // attack it
		
		// charge nearest opposing
		var disengage = false;
		if(faction == FACTIONS.player and instance_exists(obj_control_player.control_target)) {
			if(point_distance(obj_control_player.control_target.x, obj_control_player.control_target.y, closest_target.x, closest_target.y) > max_range_disengage) {
				disengage = true;	
			}
		}

		if(closest_range < attack_min_range) { // too close, back off
			xvect = x - closest_target.x;
			yvect = y - closest_target.y;
		}
		if(not disengage and closest_range > attack_max_range and object_index != obj_mothership) { // too far, close in
			xvect = closest_target.x - x;
			yvect = closest_target.y - y;
		}
		
		vector[| 0] += xvect * weight;
		vector[| 1] += yvect * weight;
		
		aim_dir = point_direction(x, y, closest_target.x, closest_target.y)
			
		// fire!
		if(closest_range < attack_max_range*1.2) {
			act_primary = true
		}
		else {
			act_primary = false;
		
		}
	}
	else {
		act_primary = false;	
	}
		
}