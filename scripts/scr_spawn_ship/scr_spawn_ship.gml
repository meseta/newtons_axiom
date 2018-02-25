var xx = argument0
var yy = argument1
var type = argument2

// select layer to spawn ship into
var target_layer = "Ships";
switch(type) {
	case SHIPTYPES.mothership:
	case SHIPTYPES.battleship:
		target_layer = "Bigships";
		break;
}
	
// create inst
var ship_inst = instance_create_layer(xx, yy, target_layer, global.ship_obj_lookup[type]);

return ship_inst