
if(not file_exists(global.hiscorename)) {
	global.highscore = 0;
	scr_save_hiscore();
}
else {
	//var file = file_text_open_read(global.hiscorename);
	//var j = file_text_read_string(file);
	//var savemap = json_decode(j);
	//file_text_close(file);
	var savemap = ds_map_secure_load(global.hiscorename);
	global.highscore = ds_map_find_value(savemap, "hiscore");
	ds_map_destroy(savemap);
}

return global.highscore;
