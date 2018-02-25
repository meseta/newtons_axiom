// fly towards center of mass of neighboring boids

var vector = argument0;
var weight = argument1;

var xcenter = 0;
var ycenter = 0;
var msigma = 0;
var max_range = 1000;

var selected_ships = ds_list_create();

// compute mass for weighting
with(obj_spacecraft) {
	if(id != other.id and faction == other.faction and obj_control_player.control_target != id) { // only match same faction, not self, and don't include control_target
		if(other.object_index != obj_miner or object_index == obj_miner) { // miners group with themselves
			if(distance_to_object(other) < max_range) {
				msigma += sqrt(mass);
				ds_list_add(selected_ships, id);
			}
		}
	}
}

// calculate positions
if(msigma > 0) {
	for(var i=0; i<ds_list_size(selected_ships); i++) {
		var ship = ds_list_find_value(selected_ships, i);
		var smass = sqrt(ship.mass);
		xcenter += ship.x * smass/msigma;
		ycenter += ship.y * smass/msigma;
	}

	ds_list_destroy(selected_ships);

	var xdelta = clamp(xcenter - x, -200, 200);
	var ydelta = clamp(ycenter - y, -200, 200);

	// square deltas
	xdelta *= abs(xdelta);
	ydelta *= abs(ydelta);
	xdelta /= 1000;
	ydelta /= 1000;
	
	vector[| 0] += xdelta * weight;
	vector[| 1] += ydelta * weight;
}