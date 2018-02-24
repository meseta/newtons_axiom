randomize();

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