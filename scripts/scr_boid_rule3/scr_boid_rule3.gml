// maintain same velocity as group

var vector = argument0;
var weight = argument1;

var hgroup = 0;
var vgroup = 0;
var count = 0;
var range = 300;

// calculate group
with(obj_spacecraft) {
	if(id != other.id and faction == other.faction) {
		if(point_distance(x, y, other.x, other.y) < range) {
			hgroup += hspd;
			vgroup += vspd;
			count += 1;
		}
	}
}

if(count) {
	var hdelta = hgroup/count - hspd;
	var vdelta = vgroup/count - vspd;
	vector[| 0] += hdelta * weight;
	vector[| 1] += vdelta * weight;
}