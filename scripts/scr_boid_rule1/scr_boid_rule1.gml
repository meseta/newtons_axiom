// fly towards center of mass of neighboring boids

var vector = argument0;
var weight = argument1;

var xcenter = 0;
var ycenter = 0;
var msigma = 0;

// compute mass for weighting
with(obj_spacecraft) {
	if(id != other.id and faction == other.faction and obj_control_player.control_target != id) {
		msigma += sqrt(mass);
	}
}

// calculate positions
with(obj_spacecraft) {
	if(id != other.id and faction == other.faction and obj_control_player.control_target != id) {
		var smass = sqrt(mass);
		xcenter += x * smass/msigma;
		ycenter += y * smass/msigma;
	}
}

var xdelta = clamp(xcenter - x, -200, 200);
var ydelta = clamp(ycenter - y, -200, 200);

// square deltas
xdelta *= abs(xdelta);
ydelta *= abs(ydelta);
xdelta /= 1000;
ydelta /= 1000;

vector[| 0] += xdelta * weight;
vector[| 1] += ydelta * weight;