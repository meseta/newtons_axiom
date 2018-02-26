var savemap = ds_map_create()
ds_map_set(savemap, "hiscore", global.highscore);

var j = json_encode(savemap);
var file=file_text_open_write(global.hiscorename);
file_text_write_string(file,j);
file_text_close(file);
ds_map_destroy(savemap);