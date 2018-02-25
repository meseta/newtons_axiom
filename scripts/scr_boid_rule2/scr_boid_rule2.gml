// keep away from obstacles

var vector = argument0;
var weight = argument1;

var xvect = 0;
var yvect = 0;
var msigma = 0;
var check_range = 50;
var craft_weight = 25;
var asteroid_weight = 100;

with(obj_spacecraft) {
	if(id != other.id) {
		var range = distance_to_object(other);
		if(range < check_range) {
			if(range < 1) {
				range = 1;
			}
			var dir = point_direction(x, y, other.x, other.y);
			xvect += lengthdir_x(craft_weight/range, dir);
			yvect += lengthdir_y(craft_weight/range, dir);
		}
	}
}


with(obj_asteroid) {
	var range = distance_to_object(other);
	if(range < check_range) {
		if(range < 1) {
			range = 1;
		}
		var dir = point_direction(x, y, other.x, other.y);
		xvect += lengthdir_x(craft_weight/range, dir);
		yvect += lengthdir_y(craft_weight/range, dir);
	}
}

vector[| 0] += xvect * weight;
vector[| 1] += yvect * weight;