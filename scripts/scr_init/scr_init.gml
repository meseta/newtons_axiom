randomize();

global.debug = 0 or debug_mode

enum SHIPTYPES {
	mothership,
	miner,
	fighter,
	destroyer,
	frigate,
	battleship,
	
	enemy_fighter,
	enemy_destroyer,
	enemy_frigate,
	enemy_battleship
}

global.ship_obj_lookup[SHIPTYPES.mothership] = obj_mothership;
global.ship_obj_lookup[SHIPTYPES.miner] = obj_miner;
global.ship_obj_lookup[SHIPTYPES.fighter] = obj_fighter;
global.ship_obj_lookup[SHIPTYPES.destroyer] = obj_destroyer;
global.ship_obj_lookup[SHIPTYPES.frigate] = obj_frigate;
global.ship_obj_lookup[SHIPTYPES.battleship] = obj_battleship;


global.ship_obj_lookup[SHIPTYPES.enemy_fighter] = obj_enemy_fighter;
global.ship_obj_lookup[SHIPTYPES.enemy_destroyer] = obj_enemy_destroyer;
global.ship_obj_lookup[SHIPTYPES.enemy_frigate] = obj_enemy_frigate;
global.ship_obj_lookup[SHIPTYPES.enemy_battleship] = obj_enemy_battleship;

global.ship_build_metals[SHIPTYPES.miner] = 50;
global.ship_build_parts[SHIPTYPES.miner] = 1;
global.ship_build_metals[SHIPTYPES.fighter] = 30;
global.ship_build_parts[SHIPTYPES.fighter] = 0;
global.ship_build_metals[SHIPTYPES.destroyer] = 100;
global.ship_build_parts[SHIPTYPES.destroyer] = 5;
global.ship_build_metals[SHIPTYPES.frigate] = 100;
global.ship_build_parts[SHIPTYPES.frigate] = 5;
global.ship_build_metals[SHIPTYPES.battleship] = 500;
global.ship_build_parts[SHIPTYPES.battleship] = 20;

enum FACTIONS {
	hostile,
	player,
	friendly
}

global.cursor_ui = false;
global.cursor_ship = false;

#macro BLOCKSIZE 2000

