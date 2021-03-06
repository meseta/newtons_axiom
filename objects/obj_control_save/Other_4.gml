/// @description create instances

// ships
var shiplist = ds_map_find_value(global.game_data, "shiplist");

for(var i=0; i<ds_list_size(shiplist); i++) {
	var ship = ds_list_find_value(shiplist, i);
	
	// create inst
	var type = ds_map_find_value(ship, "type");
	var xx = ds_map_find_value(ship, "x");
	var yy = ds_map_find_value(ship, "y");
	var ship_inst = scr_spawn_ship(xx, yy, type);
	
	// set instace vars
	var key = undefined;
	for (var j=0; j<ds_map_size(ship); j++) {
		if(is_undefined(key)) key = ds_map_find_first(ship);
		else key = ds_map_find_next(ship, key);
		variable_instance_set(ship_inst, key, ds_map_find_value(ship, key));
    }
	
	// default controller selects first player mothership
	if(obj_control_player.control_target == noone and type == SHIPTYPES.mothership and ship_inst.faction == FACTIONS.player) {
		obj_control_player.control_target = ship_inst;
		obj_control_player.x = xx;
		obj_control_player.y = yy;
	}
}

// asteroids
var asteroidlist = ds_map_find_value(global.game_data, "asteroidlist");

for(var i=0; i<ds_list_size(asteroidlist); i++) {
	var asteroid = ds_list_find_value(asteroidlist, i);
	
	// create inst
	var type = ds_map_find_value(asteroid, "type");
	var xx = ds_map_find_value(asteroid, "x");
	var yy = ds_map_find_value(asteroid, "y");
	var asteroid_inst = instance_create_layer(xx, yy, "Asteroids", type);
	
	// set instace vars
	var key = undefined;
	for (var j=0; j<ds_map_size(asteroid); j++) {
		if(is_undefined(key)) key = ds_map_find_first(asteroid);
		else key = ds_map_find_next(asteroid, key);
		variable_instance_set(asteroid_inst, key, ds_map_find_value(asteroid, key));
    }
}