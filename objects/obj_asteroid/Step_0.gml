/// @description Insert description here
// You can write your code in this editor

x += hspd;
y += vspd;
image_angle += rspd;

if(hit_damage and damagable) {
	hp -= hit_damage;
	hit_damage = 0;
	
	if(hp < 0) {
		instance_destroy();	
	}
}
