randomize();

global.debug = 0 or debug_mode

enum SHIPTYPES {
	mothership,
	miner,
	fighter,
	destroyer,
	frigate,
	battleship,
	
	enemy_fighter
}

global.ship_obj_lookup[SHIPTYPES.mothership] = obj_mothership;
global.ship_obj_lookup[SHIPTYPES.miner] = obj_miner;
global.ship_obj_lookup[SHIPTYPES.fighter] = obj_fighter;


global.ship_obj_lookup[SHIPTYPES.enemy_fighter] = obj_enemy_fighter;

global.ship_build_metals[SHIPTYPES.miner] = 50;
global.ship_build_parts[SHIPTYPES.miner] = 1;

global.ship_build_metals[SHIPTYPES.fighter] = 30;
global.ship_build_parts[SHIPTYPES.fighter] = 0;

enum FACTIONS {
	hostile,
	player,
	friendly
}

global.cursor_ui = false;
global.cursor_ship = false;

#macro BLOCKSIZE 2000

