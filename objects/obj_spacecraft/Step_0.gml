/// @description movement and control

#region particle_color
if(faction == FACTIONS.player) {
	if(object_index = obj_mothership) part_color = c_teal;
	else if(object_index = obj_miner) part_color = c_olive;
	else part_color = c_green;
}
else {
	part_color = c_red;
}

#endregion particle_color

#region boid
// movement
if(obj_control_player.control_target != id) { // AI: boids
	// state space weightings
	var m1=0.5;
	var m2=0.3;
	var m3=2;
	var m4=20;
	var m5=1;
	var m6=0.1;
	
	var vector = ds_list_create();
	ds_list_add(vector, 0, 0);
	scr_boid_rule1(vector, m1); // fly towards center of mass
	scr_boid_rule2(vector, m2); // avoid units and asteroids
	scr_boid_rule3(vector, m3); // maintain group velocity
	if(faction == FACTIONS.player) {
		scr_boid_rule4(vector, m4); // follow player controller
		scr_boid_rule5(vector, m5); // mining
		
		#region cursor
		if(position_meeting(mouse_x, mouse_y, id)) {
			global.cursor_ship = true;
		}
		#endregion cursor
	}
	scr_boid_rule6(vector, m6); // charge at hostiles

	move_amount = min(1, point_distance(0, 0, vector[| 0], vector[| 1])/20);
	if(abs(move_amount > 0)) {
		move_dir = point_direction(0, 0, vector[| 0], vector[| 1]);
	}
	
	ds_list_destroy(vector);
}

#endregion boid

#region movement
var hforce = lengthdir_x(move_amount * thrust, move_dir);
var vforce = lengthdir_y(move_amount * thrust, move_dir);

// sneaky friction/damping
if(sign(hforce) != sign(hspd)) {
	hforce -= sign(hspd) * abs(hspd) * fric;
}
if(sign(vforce) != sign(vspd)) {
	vforce -= sign(vspd) * abs(vspd) * fric;
}

if(mass) {
	var haccel = hforce/mass;
	var vaccel = vforce/mass
	hspd += haccel;
	vspd += vaccel;
}
else {
	hspd = 0;
	vspd = 0;
}

if(move_amount == 0) {
	if(abs(hspd) < 0.1) hspd = 0;
	if(abs(vspd) < 0.1) vspd = 0;
}

// max speed;
spd = point_distance(0, 0, hspd, vspd)
dir = point_direction(0, 0, hspd, vspd);
if(spd > max_speed) {
	hspd = lengthdir_x(max_speed, dir);
	vspd = lengthdir_y(max_speed, dir);
	spd = max_speed;
}

#endregion movement


#region rotation
var target_angle = dir;
if(turret == noone) { // rotates ship if no turret
	if(act_primary or act_secondary) {
		target_angle = aim_dir;
	}
}
var dtheta = angle_difference(target_angle, image_angle);
image_angle += clamp(dtheta, -rotate_rate, rotate_rate);

#endregion rotation

#region collision with asteroid

var collision_inst = instance_place(x+hspd, y+vspd, obj_asteroid);

if(collision_inst != noone) {
	if(place_meeting(x, y, collision_inst)) {
		// currently inside object
		var dir = point_direction(x, y, collision_inst.x, collision_inst.y); // direction towards center of asteroid
		var delta_hspd = lengthdir_x(1, dir);
		var delta_vspd = lengthdir_y(1, dir);
		while(place_meeting(x, y, collision_inst)) {
			x-=delta_hspd;
			y-=delta_vspd;
		}
	}
	else {
		// descend to surface
	    var dir = point_direction(0, 0, hspd, vspd);
		var delta_hspd = lengthdir_x(1, dir);
		var delta_vspd = lengthdir_y(1, dir);
		var tries = floor(spd); // allows phasing through in the case it slightly clips it
		while(!place_meeting(x+delta_hspd, y+delta_vspd, collision_inst) and tries > 0) {
			x+=delta_hspd;
			y+=delta_vspd;
			tries -= 1;
		}
	}
	
	// back off one step
	x-=delta_hspd;
	y-=delta_vspd;
	
	// damage
	var relspd = point_distance(hspd, vspd, collision_inst.hspd, collision_inst.vspd)
	var allowed_landing_speed = landing_speed;
	var dampening = 0.5
	
	if(mining_speed > 0 and object_is_ancestor(collision_inst.object_index, obj_mine)) { // special case: miners get triple landing speed on mines
		allowed_landing_speed *= 3;
		dampening = 0.2
	}
	
	if(relspd > allowed_landing_speed) {
		if(collision_inst.mass) {
			var other_mass = collision_inst.mass;	
		}
		else {
			var other_mass = 250;	
		}
		var dmg = mass * other_mass * relspd / 750
		hit_damage += dmg;
		collision_inst.hit_damage += dmg;
		
		part_particles_create_color(global.partexplode_sys, x, y, global.partexplode, c_gray, clamp(hit_damage, 5, 30))
	}
	
	// elastic collision
	var this_spd = scr_2dcollide(id, collision_inst);
	var other_spd = scr_2dcollide(collision_inst, id);
	
	hspd = this_spd[0]*dampening;
	vspd = this_spd[1]*dampening;
	collision_inst.hspd = other_spd[0]*dampening;
	collision_inst.vspd = other_spd[1]*dampening;
}

x += hspd;
y += vspd;

var effective_spd = point_distance(xprevious, yprevious, x, y);
if(effective_spd > 0.5) {

	var hdelta = (x-xprevious)/ceil(effective_spd);
	var vdelta = (y-yprevious)/ceil(effective_spd);
	for(var i=0; i<ceil(effective_spd); i++ ) {
		if(object_index == obj_mothership or object_index == obj_battleship or object_index == obj_enemy_battleship) {
			part_particles_create_color(global.parttrail_sys, xprevious+i*hdelta + lengthdir_x(5, image_angle+90), yprevious+i*vdelta + lengthdir_y(5, image_angle+90), global.parttrail, part_color, 1)
			part_particles_create_color(global.parttrail_sys, xprevious+i*hdelta + lengthdir_x(-5, image_angle+90), yprevious+i*vdelta + lengthdir_y(-5, image_angle+90), global.parttrail, part_color, 1)
		}
		else {
			part_particles_create_color(global.parttrail_sys, xprevious+i*hdelta, yprevious+i*vdelta, global.parttrail, part_color, 1)		
		}
	}
}

#endregion collision

#region damage

if(hit_damage) {
	hp -= hit_damage;
	
	unit_shake = 2;
	
	hit_damage = 0;
	
	if(hp <= 0) {
		
		if(faction == FACTIONS.hostile) {
			for(var i=0; i<ceil(max_hp/10); i++) {
				var drop = choose(obj_pickup_health, obj_pickup_part, noone, noone);
				if(drop != noone) {
					var drop_inst = instance_create_layer(x, y, "Projectiles", drop);
					drop_inst.hspd = hspd + random_range(-1, 1);
					drop_inst.vspd = vspd + random_range(-1, 1);
				}
			}
			
			global.game_data[? "score"] += max_hp;
		}
		
		repeat(10) {
			part_particles_create_color(global.partexplode_sys, x, y, global.partexplode, c_gray, max_hp)
			part_particles_create_color(global.partexplode_sys, x, y, global.partexplode, part_color, max_hp)
		}
		instance_destroy();
	}
}

if(hp < 0.75 * max_hp) {
	var factor = 50*(0.75-hp/max_hp)/0.75;
	
	if(irandom(100) < factor) {
		part_particles_create_color(global.partsmoke_sys, x, y, global.partsmoke, c_gray, 1)
	}
	
}

#endregion damage

#region mining

if(mining_speed > 0) {
	var collision_inst = collision_circle(x, y, max(16, bbox_right-bbox_left), obj_mine, true, true);
	if(collision_inst != noone) {
		
		// delay start of mining
		mining_delay += 1
		
		if(mining_delay > 30) {
			// collect resources
		    if(collision_inst.resource > 0 and cargo < max_cargo) {
				var collect = min(collision_inst.resource, mining_speed);
				collision_inst.resource -= collect;
				cargo += collect;
				
				var dir_from = point_direction(collision_inst.x, collision_inst.y, x, y) 
				var ww = (collision_inst.bbox_right - collision_inst.bbox_left)/2;
				var xx = collision_inst.x + lengthdir_x(ww, dir_from);
				var yy = collision_inst.y + lengthdir_y(ww, dir_from);
				
				part_particles_create_color(global.partexplode_sys, xx, yy, global.partexplode, c_purple, 1)	
				
				// increase movement friction to slow down
				hspd *= 0.95;
				vspd *= 0.95;
				
				unit_shake = 1;
			}
		
		}
	}
	else {
		mining_delay = 0;
	}
	
	if(cargo > 0) { // switch cargo
		if(object_index == obj_mothership and faction = FACTIONS.player) { // is already mothership,
			global.game_data[? "metals"] += cargo;
			global.game_data[? "score"] += cargo;
			cargo = 0;
		}
		else {
			var collision_inst = collision_circle(x, y, 10, obj_mothership, false, true);
			if(collision_inst != noone) {
				if(collision_inst.faction == faction) {
					global.game_data[? "metals"] += cargo;
					global.game_data[? "score"] += cargo;
					cargo = 0;
				}
			}
		}
	}
	
	// sprite
	if(image_number > 1) { 
		image_index = ceil((image_number-1) * (cargo/max_cargo));
	}
}

#endregion mining

#region attacking
	fire_timer += 1;
	fire_timer_secondary += 1;
	
	if(weapon != noone and act_primary and fire_timer > fire_rate) {
		fire_timer = 0;
		var projectile = instance_create_layer(x, y, "Projectiles", weapon);
		projectile.aim_dir = aim_dir + random_range(-5, 5);
		projectile.add_hspd = hspd;
		projectile.add_vspd = vspd;
		projectile.faction = faction;
		
		// recoil
		var recoil_dampening = 3;
		hspd -= lengthdir_x(projectile.spd, aim_dir)*projectile.mass/(mass*recoil_dampening);
		vspd -= lengthdir_y(projectile.spd, aim_dir)*projectile.mass/(mass*recoil_dampening);
	}
	if(weapon_secondary != noone and act_secondary and fire_timer_secondary > fire_rate_secondary) {
		fire_timer_secondary = 0;
		var projectile = instance_create_layer(x, y, "Projectiles", weapon_secondary);
		projectile.aim_dir = aim_dir + random_range(-5, 5);
		projectile.add_hspd = hspd;
		projectile.add_vspd = vspd;
		projectile.faction = faction;
		
		// recoil
		var recoil_dampening = 3;
		hspd -= lengthdir_x(projectile.spd, aim_dir)*projectile.mass/(mass*recoil_dampening);
		vspd -= lengthdir_y(projectile.spd, aim_dir)*projectile.mass/(mass*recoil_dampening);
	}
#endregion attacking

sprite_timer += 1;