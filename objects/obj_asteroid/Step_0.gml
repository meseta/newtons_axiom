/// @description Insert description here
// You can write your code in this editor

#region movement
/*var hforce = 0;
var vforce = 0;

hforce -= sign(hspd) * hspd*hspd * fric;
vforce -= sign(vspd) * vspd*vspd * fric;

var haccel = hforce/mass;
var vaccel = vforce/mass

hspd += haccel;
vspd += vaccel;

if(abs(hspd) < 0.1) hspd = 0;
if(abs(vspd) < 0.1) vspd = 0;*/

#endregion movement

#region collision
/*
var dir = point_direction(0, 0, hspd, vspd);
if(place_meeting(x+hspd, y+vspd, obj_spacecraft)) {
	var delta_hspd = lengthdir_x(1, dir);
	var delta_vspd = lengthdir_y(1, dir);
	while(!place_meeting(x+delta_hspd, y+delta_vspd, obj_asteroid)) {
		x+=delta_hspd;
		y+=delta_vspd;
	}
	hspd = 0;
	vspd = 0;
}*/

x += hspd;
y += vspd;

#endregion collision