/// @description save data

global.save_ship_vars = ds_list_create();
ds_list_add(global.save_ship_vars, "type", "x", "y", "faction", "hp", "cargo", "hspd", "vspd", "image_angle");
global.save_asteroid_vars = ds_list_create();
ds_list_add(global.save_asteroid_vars, "type", "x", "y", "hp", "resource", "hspd", "vspd", "rspd");

// save ships
var shiplist = ds_map_find_value(global.game_data, "shiplist");
ds_list_clear(shiplist);

with(obj_spacecraft) {
	var ship = ds_map_create();
	
	// get instace vars
	for (var i=0; i<ds_list_size(global.save_ship_vars); i++) {
		var var_name = ds_list_find_value(global.save_ship_vars, i);
		if(variable_instance_exists(id, var_name)) {
			var var_value = variable_instance_get(id, var_name);
			ds_map_add(ship, var_name, var_value);
		}
    }
	
	ds_list_add(shiplist, ship);
	ds_list_mark_as_map(shiplist, ds_list_size(shiplist)-1);
}

// save asteroids
var asteroidlist = ds_map_find_value(global.game_data, "asteroidlist");
ds_list_clear(asteroidlist);

with(obj_asteroid) {
	var asteroid = ds_map_create();
	
	// get instace vars
	for (var i=0; i<ds_list_size(global.save_asteroid_vars); i++) {
		var var_name = ds_list_find_value(global.save_asteroid_vars, i);
		if(variable_instance_exists(id, var_name)) {
			var var_value = variable_instance_get(id, var_name);
			ds_map_add(asteroid, var_name, var_value);
		}
    }
	ds_map_add(asteroid, "type", object_index);
	
	ds_list_add(asteroidlist, asteroid);
	ds_list_mark_as_map(asteroidlist, ds_list_size(asteroidlist)-1);
}

scr_save_data(global.game_data);
