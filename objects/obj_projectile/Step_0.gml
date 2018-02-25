/// @description Insert description here
// You can write your code in this editor

lifetime -= 1;
if(lifetime <= 0) instance_destroy();

hspd = lengthdir_x(spd, aim_dir) + add_hspd;
vspd = lengthdir_y(spd, aim_dir) + add_vspd;

x += hspd;
y += vspd;

image_angle = aim_dir;

var collision_inst = instance_place(x, y, obj_spacecraft);

if(collision_inst != noone) {
	if(collision_inst.faction != faction) {
		collision_inst.hit_damage += damage
		collision_inst.hspd += hspd*mass/collision_inst.mass;
		collision_inst.vspd += vspd*mass/collision_inst.mass;
		instance_destroy();
	}
}


var collision_inst = instance_place(x, y, obj_asteroid);

if(collision_inst != noone) {
	if(collision_inst.damagable) {
		collision_inst.hit_damage += damage
		collision_inst.hspd += hspd*mass/collision_inst.mass;
		collision_inst.vspd += vspd*mass/collision_inst.mass;
		instance_destroy();
	}
	else {
		instance_destroy();	
	}
}
