/// @description create ship instances

var shiplist = ds_map_find_value(global.game_data, "shiplist");

for(var i=0; i<ds_list_size(shiplist); i++) {
	var ship = ds_list_find_value(shiplist, i);
	
	// select layer to spawn ship into
	var type = ds_map_find_value(ship, "type");
	var target_layer = "Ships";
	switch(type) {
		case SHIPTYPES.mothership:
		case SHIPTYPES.battleship:
			targt_layer = "Bigships";
			break;
		case SHIPTYPES.asteroid:
			targt_layer = "Asteroids";
			break;	
	}
	
	// create inst
	var xx = ds_map_find_value(ship, "x");
	var yy = ds_map_find_value(ship, "y");
	var ship_inst = instance_create_layer(xx, yy, target_layer, global.ship_obj_lookup[type]);
	
	// set instace vars
	var key = undefined;
	for (var j=0; j<ds_map_size(ship); j++) {
		if(is_undefined(key)) key = ds_map_find_first(ship);
		else key = ds_map_find_next(ship, key);
		variable_instance_set(ship_inst, key, ds_map_find_value(ship, key));
    }
	
	// default controller selects first player mothership
	if(obj_control_player.control_target == noone and type == SHIPTYPES.mothership and ship_inst.player) {
		obj_control_player.control_target = ship_inst;
		obj_control_player.x = xx;
		obj_control_player.y = yy;
	}
}