/// @description Insert description here
// You can write your code in this editor


if(mass) {
	x += hspd;
	y += vspd;
	image_angle += rspd;
	
	
	if(not object_is_ancestor(object_index, obj_mine)) {
		var collision_inst = instance_place(x, y, obj_asteroid);

		if(collision_inst != noone) {
		
			hit_damage = max_hp/2;
			var this_spd = scr_2dcollide(id, collision_inst);
			var other_spd = scr_2dcollide(collision_inst, id);
	
			x -= hspd;
			y -= vspd;
			hspd = this_spd[0]*0.5;
			vspd = this_spd[1]*0.5;
			collision_inst.hspd = other_spd[0]*0.5;
			collision_inst.vspd = other_spd[1]*0.5;
		}
	}
	
	if(hit_damage and damagable) {
		hp -= hit_damage;
		hit_damage = 0;
	
		if(hp <= 0) {
			for(var i=0; i<ceil(max_hp/50); i++) {
				var drop = choose(obj_pickup_part, noone);
				if(drop != noone) {
					var drop_inst = instance_create_layer(x, y, "Projectiles", drop);
					drop_inst.hspd = hspd + random_range(-1, 1);
					drop_inst.vspd = vspd + random_range(-1, 1);
				}
			}
			
			global.game_data[? "score"] += max_hp/2;
			var ww = bbox_right - bbox_left;
			repeat(100) {
				var rd = random(ww/2)
				var rt = random(360);
				var xx = lengthdir_x(rd, rt)
				var yy = lengthdir_y(rd, rt)
				part_particles_create_color(global.partexplode_sys, x+xx, y+yy, global.partexplode, c_yellow, max_hp/10)	
			}
			instance_destroy();
		}
	}
}