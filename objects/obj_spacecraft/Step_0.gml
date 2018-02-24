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

#region movement
var hforce = lengthdir_x(move_amount * thrust, move_dir);
var vforce = lengthdir_y(move_amount * thrust, move_dir);

hforce -= sign(hspd) * hspd*hspd * fric;
vforce -= sign(vspd) * vspd*vspd * fric;

var haccel = hforce/mass;
var vaccel = vforce/mass

hspd += haccel;
vspd += vaccel;

if(move_amount == 0) {
	if(abs(hspd) < 0.1) hspd = 0;
	if(abs(vspd) < 0.1) vspd = 0;
}

// max speed;
spd = point_distance(0, 0, hspd, vspd)
if(spd > max_speed) {
	var dir = point_direction(0, 0, hspd, vspd);
	hspd = lengthdir_x(max_speed, dir);
	vspd = lengthdir_y(max_speed, dir);
	spd = max_speed;
}



#endregion movement

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
		while(!place_meeting(x+delta_hspd, y+delta_vspd, collision_inst)) {
			x+=delta_hspd;
			y+=delta_vspd;
		}
	}
	
	// back off one step
	x-=delta_hspd;
	y-=delta_vspd;
	
	// damage
	var relspd = point_distance(hspd, vspd, collision_inst.hspd, collision_inst.vspd)
	if(relspd > landing_speed) {
		var dmg = mass * collision_inst.mass * relspd / 500
		hit_damage += dmg;
		collision_inst.hit_damage += dmg;
	}
	
	// elastic collision
	var this_spd = scr_2dcollide(id, collision_inst);
	var other_spd = scr_2dcollide(collision_inst, id);
	
	hspd = this_spd[0]*0.5;
	vspd = this_spd[1]*0.5;
	collision_inst.hspd = other_spd[0]*0.5;
	collision_inst.vspd = other_spd[1]*0.5;
}

x += hspd;
y += vspd;

#endregion collision

#region damage

if(hit_damage) {
	hp -= hit_damage;
	hit_damage = 0;
	
	if(hp < 0) {
		instance_destroy();	
	}
}

#endregion damage

#region mining

if(mining_efficiency > 1) {
	var collision_inst = collision_circle( x, x,  bbox_right-bbox_left, obj_mine, true, true);
	if(collision_inst != noone) {
	    if(collision_inst.resource > 0) {
			var collect = min(collision_inst.resource, mining_speed);
			collision_inst.resource -= collect;
			global.game_data[? "metals"] += collect * mining_efficiency;
		}
	}
}

#endregion mining
