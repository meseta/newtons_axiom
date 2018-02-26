var cx = argument0;
var cy = argument1;

var closest_mothership = noone;
var closest_range = 0;
	
with(obj_mothership) {
	if(faction == FACTIONS.player) {
		var range = distance_to_point(cx, cy);
		if(closest_mothership == noone or range < closest_range) {
			closest_mothership = id;
			closest_range = range;
		}
	}
}

return closest_mothership;