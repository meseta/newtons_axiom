/// @description Insert description here
// You can write your code in this editor

x += hspd;
y += vspd;

hspd *= 0.99;
vspd *= 0.99;

if(abs(hspd) < 0.01) hspd = 0;
if(abs(vspd) < 0.01) vspd = 0;

if(place_meeting(x, y, obj_asteroid)) {
	instance_destroy();
}

if(instance_exists(obj_control_player.control_target)) {
	if(place_meeting(x, y, obj_control_player.control_target)) {
		with(obj_control_player.control_target) {
			hp += 20;
			if(hp > max_hp) hp = max_hp;
		}
		instance_destroy();
	}
}