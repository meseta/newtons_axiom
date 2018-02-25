var build_item = argument0;

// check costs
var metal = global.ship_build_metals[build_item];
var parts = global.ship_build_parts[build_item];

if(metal <= ds_map_find_value(global.game_data, "metals") and parts <= ds_map_find_value(global.game_data, "parts")) {
	return true;	
}
return false;