/// @description Insert description here
// You can write your code in this editor

block_x = undefined;
block_y = undefined;
last_block_x = undefined;
last_block_y = undefined;

current_block_danger = 0;
current_block_hostility = 0;
asteroid_spawn_timeout = 0;
ship_spawn_timeout = 0;

if(global.new_game == true) {
	scr_spawn_block(-1, -1);
	scr_spawn_block(-1, 0);
	scr_spawn_block(-1, 1);
	scr_spawn_block(0, -1);
	scr_spawn_block(0, 0);
	scr_spawn_block(0, 1);
	scr_spawn_block(1, -1);
	scr_spawn_block(1, 0);
	scr_spawn_block(1, 1);
	global.new_game = false;
}