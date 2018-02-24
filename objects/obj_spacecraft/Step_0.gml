/// @description movement and control

// movement
if(not player) { // AI

}
else {

}

/*aim_dir
act_primary
act_secondary
move_dir
move_amount*/

var hforce = lengthdir_x(move_amount * thrust, move_dir);
var vforce = lengthdir_y(move_amount * thrust, move_dir);

hforce -= sign(hspd) * hspd*hspd * fric;
vforce -= sign(vspd) * vspd*vspd * fric;

var haccel = hforce/mass;
var vaccel = vforce/mass

hspd += haccel;
vspd += vaccel;

// max speed;
spd = point_distance(0, 0, hspd, vspd)
if(spd > max_speed) {
	var dir = point_direction(0, 0, hspd, vspd);
	hspd = lengthdir_x(max_speed, dir);
	vspd = lengthdir_y(max_speed, dir);
	spd = max_speed;
}


if(move_amount == 0) {
	if(abs(hspd) < 0.1) hspd = 0;
	if(abs(vspd) < 0.1) vspd = 0;
}

x += hspd;
y += vspd;
