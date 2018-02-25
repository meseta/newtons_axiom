/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

tooltip_text = "";

var metal = global.ship_build_metals[build_item];
var parts = global.ship_build_parts[build_item];
if(metal > 0) {
	tooltip_text += " " + string(metal) + " Metal"	
}
if(parts > 0) {
	tooltip_text += " " + string(parts) + " Parts"
}

if(string_length(build_text)) {
	if(string_length(tooltip_text)) {
		tooltip_text = build_text + ":" + tooltip_text;	
	}
	else {
		tooltip_text = build_text
	}
}

action_argument = build_item

event_inherited();
