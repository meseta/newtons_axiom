global.game_data = ds_map_create();

ds_map_add(global.game_data, "score", 0);
ds_map_add(global.game_data, "gameover", false);
	
// resources
if(global.debug or 1) {
	ds_map_add(global.game_data, "metals", 3000);
	ds_map_add(global.game_data, "parts", 500);
}
else {
	ds_map_add(global.game_data, "metals", 100);
	ds_map_add(global.game_data, "parts", 5);
}

// ships
var shiplist = ds_list_create();

var ship = ds_map_create();
ds_map_add(ship, "type", SHIPTYPES.mothership);
ds_map_add(ship, "x", 480);
ds_map_add(ship, "y", 270);
ds_map_add(ship, "hspd", 0);
ds_map_add(ship, "yspd", 0);
ds_map_add(ship, "faction", FACTIONS.player);
ds_list_add(shiplist, ship);
ds_list_mark_as_map(shiplist, ds_list_size(shiplist)-1);

repeat(3) {
	var ship = ds_map_create();
	ds_map_add(ship, "type", SHIPTYPES.miner);
	ds_map_add(ship, "x", 400 + irandom(100));
	ds_map_add(ship, "y", 270 + irandom(100));
	ds_map_add(ship, "hspd", 0);
	ds_map_add(ship, "yspd", 0);
	ds_map_add(ship, "faction", FACTIONS.player);
	ds_list_add(shiplist, ship);
	ds_list_mark_as_map(shiplist, ds_list_size(shiplist)-1);
}

repeat(5) {
	var ship = ds_map_create();
	ds_map_add(ship, "type", SHIPTYPES.fighter);
	ds_map_add(ship, "x", 400 + irandom(100));
	ds_map_add(ship, "y", 270 + irandom(100));
	ds_map_add(ship, "hspd", 0);
	ds_map_add(ship, "yspd", 0);
	ds_map_add(ship, "faction", FACTIONS.player);
	ds_list_add(shiplist, ship);
	ds_list_mark_as_map(shiplist, ds_list_size(shiplist)-1);
}

repeat(3) {
	var ship = ds_map_create();
	ds_map_add(ship, "type", SHIPTYPES.enemy_fighter);
	ds_map_add(ship, "x", 600 + irandom(100));
	ds_map_add(ship, "y", 170 + irandom(100));
	ds_map_add(ship, "hspd", 0);
	ds_map_add(ship, "yspd", 0);
	ds_map_add(ship, "faction", FACTIONS.hostile);
	ds_list_add(shiplist, ship);
	ds_list_mark_as_map(shiplist, ds_list_size(shiplist)-1);
}


ds_map_add_list(global.game_data, "shiplist", shiplist);

// asteroids/mines
var asteroidlist = ds_list_create();

var asteroid = ds_map_create();
ds_map_add(asteroid, "type", obj_asteroid_medium);
ds_map_add(asteroid, "x", 700);
ds_map_add(asteroid, "y", 350);
ds_map_add(asteroid, "hspd", 0);
ds_map_add(asteroid, "yspd", 0);
ds_list_add(asteroidlist, asteroid);
ds_list_mark_as_map(asteroidlist, ds_list_size(asteroidlist)-1);

var asteroid = ds_map_create();
ds_map_add(asteroid, "type", obj_mine_small);
ds_map_add(asteroid, "x", 250);
ds_map_add(asteroid, "y", 350);
ds_map_add(asteroid, "hspd", 0);
ds_map_add(asteroid, "yspd", 0);
ds_list_add(asteroidlist, asteroid);
ds_list_mark_as_map(asteroidlist, ds_list_size(asteroidlist)-1);

ds_map_add_list(global.game_data, "asteroidlist", asteroidlist);


var block_spawned = ds_map_create();
ds_map_add_map(global.game_data, "block_spawned", block_spawned)

scr_save_data(global.game_data);

global.new_game = true;
room_goto(rm_game);