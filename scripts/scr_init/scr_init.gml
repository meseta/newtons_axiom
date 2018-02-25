randomize();

global.debug = 0 or debug_mode

enum SHIPTYPES {
	mothership,
	miner,
	fighter,
	destroyer,
	frigate,
	battleship,
	
	asteroid,
}

global.ship_obj_lookup[SHIPTYPES.mothership] = obj_mothership;
global.ship_obj_lookup[SHIPTYPES.miner] = obj_miner;

enum SHIPSTATE {
	nominal,
	mine,
	ferry
}

enum FACTIONS {
	hostile,
	player,
	friendly
}