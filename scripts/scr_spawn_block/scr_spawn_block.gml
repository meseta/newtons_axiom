var new_x = argument0;
var new_y = argument1;

var block_resource = scr_block_resource(new_x, new_y);
var block_hostility = scr_block_hostility(new_x, new_y);

// resource mines - check if already spawned:

var block_spawned = ds_map_find_value(global.game_data, "block_spawned")
var block_spawned_x = ds_map_find_value(block_spawned, new_x)
var block_new = true;
if(is_undefined(block_spawned_x)) { // no X
	// create x and y
	var block_spawned_y = ds_list_create();
	ds_list_add(block_spawned_y, new_y);
	ds_map_add_list(block_spawned, new_x, block_spawned_y);
}
else { // has x
	var block_spawned_y = ds_list_find_index(block_spawned_x, new_y);
	if(block_spawned_y == -1) { // no y
		ds_list_add(block_spawned_x, new_y)
	}
	else { // has y
		block_new = false;
	}
}

// spawn new mines
if(block_new) {
	var num_mines = 0;
	if(block_resource < 20) num_mines = 0;
	else if(block_resource < 40) num_mines = 1
	else if(block_resource < 60) num_mines = 2
	else if(block_resource < 80) num_mines = 3
	else num_mines = 4
	
	repeat(num_mines) {
		var mine_inst = instance_create_layer(new_x*BLOCKSIZE, new_y*BLOCKSIZE, "Asteroids", obj_mine_small);
		with(mine_inst) {
			do {
				var xx = random_range(new_x*BLOCKSIZE, (new_x+1)*BLOCKSIZE);
				var yy = random_range(new_y*BLOCKSIZE, (new_y+1)*BLOCKSIZE);	
			} until(place_empty(xx, yy));
			x = xx;
			y = yy;
		}
		
	}
}

// spawn enemies
var num_enemy_groups = 0;
var enemy_difficulty = 0;

if(block_hostility == 0) {
	num_enemy_groups = 0;
	enemy_difficulty = 0;
}
else if(block_hostility < 30) {
	num_enemy_groups = ceil(block_hostility/8);
	enemy_difficulty = 1;
}
else if(block_hostility < 60) {
	num_enemy_groups = 3;
	enemy_difficulty = 2;
}
else if(block_hostility < 70) {
	num_enemy_groups = 2;
	enemy_difficulty = 4;
}
else if(block_hostility < 80) {
	num_enemy_groups = 1;
	enemy_difficulty = 10;
}
else if(block_hostility < 90) {
	num_enemy_groups = 2;
	enemy_difficulty = 8;
}
else {
	num_enemy_groups = 1;
	enemy_difficulty = 20;
}

	
repeat(num_enemy_groups) {
	var xx = random_range(new_x*BLOCKSIZE, (new_x+1)*BLOCKSIZE);
	var yy = random_range(new_y*BLOCKSIZE, (new_y+1)*BLOCKSIZE);	
	
	var difficulty_total = 0;
	while(difficulty_total < enemy_difficulty) {
		var diff = enemy_difficulty - difficulty_total;
		var selected_ship = noone;
		
		if(diff < 2) {
			selected_ship = SHIPTYPES.enemy_fighter;
		}
		else if(diff < 5) {
			selected_ship = choose(SHIPTYPES.enemy_fighter, SHIPTYPES.enemy_fighter, SHIPTYPES.enemy_destroyer, SHIPTYPES.enemy_frigate);
		}
		else if(diff < 10) {
			selected_ship = choose(SHIPTYPES.enemy_destroyer, SHIPTYPES.enemy_frigate, SHIPTYPES.enemy_battleship);
		}
		else {
			selected_ship = SHIPTYPES.enemy_battleship
		}
		
		switch(selected_ship) {
			case SHIPTYPES.enemy_fighter:
				difficulty_total += 1;
				break;
			case SHIPTYPES.enemy_frigate:
			case SHIPTYPES.enemy_destroyer:
				difficulty_total += 2;
				break;
			case SHIPTYPES.enemy_battleship:
				difficulty_total += 4;		
		}
		
		var new_ship = scr_spawn_ship(xx+random_range(-100,100), yy+random_range(-100,100), selected_ship);
		new_ship.faction = FACTIONS.hostile;
	}
		
}
