// fly towards center of mass of neighboring boids

var vector = argument0;
var weight = argument1;

var hgroup = 0;
var vgroup = 0;
var count = 0;


// calculate positions
with(obj_spacecraft) {
	if(id != other.id and faction == other.faction) {
		hgroup += hspd;
		vgroup += vspd;
		count += 1;
	}
}

var hdelta = hgroup/count - hspd;
var vdelta = vgroup/count - vspd;
vector[| 0] += hdelta * weight;
vector[| 1] += vdelta * weight;