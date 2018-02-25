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

enum FACTIONS {
	hostile,
	player,
	friendly
}