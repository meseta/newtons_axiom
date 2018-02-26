/// @description Insert description here
// You can write your code in this editor

if(mass) {
	x += hspd;
	y += vspd;
	image_angle += rspd;
	
	if(hit_damage and damagable) {
		hp -= hit_damage;
		hit_damage = 0;
	
		if(hp < 0) {
			for(var i=0; i<ceil(max_hp/50); i++) {
				var drop = choose(obj_pickup_part, noone);
				if(drop != noone) {
					var drop_inst = instance_create_layer(x, y, "Projectiles", drop);
					drop_inst.hspd = hspd + random_range(-1, 1);
					drop_inst.vspd = vspd + random_range(-1, 1);
				}
			}
			
			global.game_data[? "score"] += max_hp/2;
			instance_destroy();
		}
	}
}