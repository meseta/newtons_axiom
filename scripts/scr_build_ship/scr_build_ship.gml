var build_item = argument0;

// check costs
if(scr_build_ship_check(build_item)) {
	var metal = global.ship_build_metals[build_item];
	var parts = global.ship_build_parts[build_item];

	global.game_data[? "metals"] -= metal;
	global.game_data[? "parts"] -= parts;
	
	// select nearest player mothership to screen center
	var cx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2
	var cy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2
	var closest_mothership = scr_closest_player_mothership(cx, cy);
	
	if(closest_mothership != noone) {
		var new_ship = scr_spawn_ship(closest_mothership.x, closest_mothership.y, build_item);
		new_ship.faction = FACTIONS.player;
	}
}
