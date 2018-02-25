// fly towards center of mass of neighboring boids

var vector = argument0;
var weight = argument1;

var xdelta = 0;
var ydelta = 0;
var max_range = 600;

if(faction == FACTIONS.player) {
	if(instance_exists(obj_control_player.control_target)) {
		xdelta = clamp(obj_control_player.control_target.x - x, -max_range, max_range);
		ydelta = clamp(obj_control_player.control_target.y - y, -max_range, max_range);
	}
}

vector[| 0] += xdelta * weight/max_range;
vector[| 1] += ydelta * weight/max_range;