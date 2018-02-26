var savemap = argument0

var j = json_encode(savemap);
var file=file_text_open_write(global.savename);
file_text_write_string(file,j);
file_text_close(file);
