if(not file_exists(global.savename)) return false;

var temp_data = scr_load_data();
var gameover = ds_map_find_value(temp_data, "gameover");
if(gameover) return false;
ds_map_destroy(temp_data);

return true;
