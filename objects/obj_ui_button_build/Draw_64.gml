/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var obj = global.ship_obj_lookup[build_item]
var spr = object_get_sprite(obj)
shader_set(shd_bloom);
draw_sprite(spr, 0, xx, yy);
shader_reset();