// keep away from obstacles

var vector = argument0;
var weight = argument1;

if(mining_speed > 0 and instance_exists(obj_control_player.control_target) and object_index != obj_mothership) {
	var max_range_to_player = 200;
	
	var closest_mine = noone;
	var closest_mine_range = 0;

	with(obj_mine) { // fetch all mines and select closesst with resources
		if(resource > 0) {
			var range = distance_to_point(obj_control_player.control_target.x, obj_control_player.control_target.y);
			if(range < max_range_to_player) {
				if(closest_mine == noone or range < closest_mine_range) {
					closest_mine = id;
					closest_mine_range = range;
				}
			}
		}
	}

	
	var xvect = 0;
	var yvect = 0;
	
	if(closest_mine == noone or cargo >= max_cargo) { // no instance closeby or cargo full, find mothership
		var closest_mothership = noone;
		var closest_ms_range = 0;
		with(obj_mothership) {
			if(faction == other.faction) {
				var range = distance_to_object(other);
				if(closest_mothership == noone or range < closest_ms_range) {
					closest_mothership = id;
					closest_ms_range = range;
				}
			}
		}
		
		if(closest_mothership != noone) {
			xvect = closest_mothership.x - x;
			yvect = closest_mothership.y - y;
		}
		
		// if close to a mine, get a boost away from it (prevents getting stuck to it)
		/*if(closest_mine != noone) {
			var dir = point_direction(x, y, closest_mine.x, closest_mine.y);
			if(closest_mine_range < 1) closest_mine_range = 1;
			xvect -= lengthdir_x(1000/closest_mine_range, dir);
			yvect -= lengthdir_y(1000/closest_mine_range, dir);
			scr_debug("repel", closest_mine_range)
		}*/
		
	}
	else if(closest_mine != noone) { // instance nearby, go to it
		var dir = point_direction(x, y, closest_mine.x, closest_mine.y);
		xvect = lengthdir_x(closest_mine_range, dir);
		yvect = lengthdir_y(closest_mine_range, dir);
	}
	
	vector[| 0] += xvect * weight;
	vector[| 1] += yvect * weight;
}