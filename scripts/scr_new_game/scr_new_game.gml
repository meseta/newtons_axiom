global.game_data = ds_map_create();

// resources
ds_map_add(global.game_data, "metals", 100);

// ships
var shiplist = ds_list_create();

var ship = ds_map_create();
ds_map_add(ship, "type", SHIPTYPES.mothership);
ds_map_add(ship, "health", 100);
ds_map_add(ship, "x", 480);
ds_map_add(ship, "y", 270);
ds_map_add(ship, "hspd", 0);
ds_map_add(ship, "yspd", 0);
ds_map_add(ship, "player", true);

ds_list_add(shiplist, ship);
ds_list_mark_as_map(shiplist, ds_list_size(shiplist)-1);

ds_map_add_list(global.game_data, "shiplist", shiplist);