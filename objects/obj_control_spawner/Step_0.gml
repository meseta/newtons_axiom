/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_control_player.control_target)) {
	block_x = floor(obj_control_player.x/BLOCKSIZE);
	block_y = floor(obj_control_player.y/BLOCKSIZE);

	if(block_x != last_block_x or block_y != last_block_y) { // entered a new block
	
		// trim everything except player ships outside blocks
		var xmin = (other.block_x - 1) * BLOCKSIZE;
		var xmax = (other.block_x + 2) * BLOCKSIZE;
		var ymin = (other.block_y - 1) * BLOCKSIZE;
		var ymax = (other.block_y + 2) * BLOCKSIZE;
	
		with(obj_spacecraft) {
			if(faction != FACTIONS.player) {
				if(x < xmin or x > xmax or y < ymin or y > ymax) {
					scr_debug("Ship de-blocked")
					instance_destroy();
				}
			}
		}
	
		with(obj_asteroid) {
			if(not object_is_ancestor(object_index, obj_mine)) {
				if(x < xmin or x > xmax or y < ymin or y > ymax) {
					scr_debug("asteroid de-blocked")
					instance_destroy();
				}
			}
		}
	
		// work out new blocks
		var block_new;
		block_new[2, 2] = false;
		block_new[2, 1] = false;
		block_new[2, 0] = false;
		block_new[1, 2] = false;
		block_new[1, 1] = false;
		block_new[1, 0] = false;
		block_new[0, 2] = false;
		block_new[0, 1] = false;
		block_new[0, 0] = false;
		// 0,0 1,0 2,0
		// 0,1  x  2,1
		// 0,2 1,2 2,2
		
		if(is_undefined(last_block_x) or is_undefined(last_block_y)) {
			block_new[2, 2] = true;
			block_new[2, 1] = true;
			block_new[2, 0] = true;
			block_new[1, 2] = true;
			block_new[1, 1] = true;
			block_new[1, 0] = true;
			block_new[0, 2] = true;
			block_new[0, 1] = true;
			block_new[0, 0] = true;
		}
		else {
			if(block_x > last_block_x) { // create new x blocks
				block_new[2, 0] = true;
				block_new[2, 1] = true;
				block_new[2, 2] = true;
			}
			else if(block_x < last_block_x) {
				block_new[0, 0] = true;
				block_new[0, 1] = true;
				block_new[0, 2] = true;
			}
		
			if(block_y > last_block_y) { // create new x blocks
				block_new[0, 2] = true;
				block_new[1, 2] = true;
				block_new[2, 2] = true;
			}
			else if(block_y < last_block_y) {
				block_new[0, 0] = true;
				block_new[1, 0] = true;
				block_new[2, 0] = true;
			}
		}
	
		for(var i=0; i<3; i++) {
			var new_x = block_x + i-1;
			for(var j=0; j<3; j++) {
				var new_y = block_y +j-1;
			
				if(block_new[i, j]) {
					scr_spawn_block(new_x, new_y);
				}
			}
		}
		
		current_block_danger = scr_block_danger(block_x, block_y);
		current_block_hostility = scr_block_hostility(block_x, block_y);
	}
	
	// spawn random asteroids
	if(current_block_danger > 0) {
		asteroid_spawn_timeout -= 1
		
		if(asteroid_spawn_timeout <= 0) {
			// spawn new asteroid
			if(current_block_danger < 30) {
				var asteroid_choice = obj_asteroid_small;
			}
			else if(current_block_danger < 60) {
				var asteroid_choice = choose(obj_asteroid_small, obj_asteroid_medium);
			}
			else {
				var asteroid_choice = choose(obj_asteroid_small, obj_asteroid_medium, obj_asteroid_big)
			}
			
			var spawn_dir = random(360);
			var spawn_x = obj_control_player.x + lengthdir_x(1000, spawn_dir);
			var spawn_y = obj_control_player.y + lengthdir_y(1000, spawn_dir);
			var asteroid_inst = instance_create_layer(spawn_x, spawn_y, "Asteroids", asteroid_choice);
			
			var travel_dir = (spawn_dir - 180) + random_range(-30, 30);
			var travel_spd = random_range(3,5);
			asteroid_inst.hspd = lengthdir_x(travel_spd, travel_dir);
			asteroid_inst.vspd = lengthdir_y(travel_spd, travel_dir);
			scr_debug("spawned asteroid")
				
				
			// set up next spawn
			var time_constant = (100-current_block_danger)*10
			asteroid_spawn_timeout = 8*60 + random(time_constant)
			scr_debug("asteroid timeout", asteroid_spawn_timeout);
		}
	}
	
	// spawn random units
	if(current_block_hostility > 0) {
		ship_spawn_timeout -= 1
		
		if(ship_spawn_timeout <= 0) {
			// spawn new asteroid
			if(current_block_hostility < 30) {
				var ship_choice = SHIPTYPES.enemy_fighter;
			}
			else if(current_block_hostility < 60) {
				var ship_choice = choose(SHIPTYPES.enemy_fighter, SHIPTYPES.enemy_fighter);
			}
			else {
				var ship_choice = choose(SHIPTYPES.enemy_fighter, SHIPTYPES.enemy_fighter, SHIPTYPES.enemy_fighter)
			}
			
			var spawn_dir = random(360);
			var spawn_x = obj_control_player.x + lengthdir_x(600, spawn_dir);
			var spawn_y = obj_control_player.y + lengthdir_y(600, spawn_dir);
			var ship_inst = scr_spawn_ship(spawn_x, spawn_y, ship_choice);
			ship_inst.faction = FACTIONS.hostile;
			
			var travel_dir = (spawn_dir - 180) + random_range(-30, 30);
			var travel_spd = 3;
			ship_inst.hspd = lengthdir_x(travel_spd, travel_dir);
			ship_inst.vspd = lengthdir_y(travel_spd, travel_dir);
			scr_debug("spawned enemy ship")
				
				
			// set up next spawn
			var time_constant = (100-current_block_hostility)*10
			ship_spawn_timeout = 8*60 + random(time_constant)
			scr_debug("ship timeout", ship_spawn_timeout);
		}
	}
	
	last_block_x = block_x;
	last_block_y = block_y;
}