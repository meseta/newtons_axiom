/// @description disable surface drawing

application_surface_draw_enable(false);

global.parttrail_sys = part_system_create();
part_system_layer(global.parttrail_sys, "Effects");
global.parttrail = part_type_create();
part_type_shape(global.parttrail, pt_shape_pixel);
part_type_size(global.parttrail, 2, 2, 0, 0);
part_type_alpha3(global.parttrail, 0.5, 1.0, 0.0);
part_type_speed(global.parttrail, 0, 0, 0, 0);
part_type_direction(global.parttrail, 0, 359, 0, 0);
part_type_gravity(global.parttrail, 0, 270);
part_type_life(global.parttrail, 30, 30);
part_type_blend(global.parttrail, true);

global.partexplode_sys = part_system_create();
part_system_layer(global.partexplode_sys, "Effects");
global.partexplode = part_type_create();
part_type_shape(global.partexplode, pt_shape_pixel);
part_type_size(global.partexplode, 2, 3, 0, 0);
part_type_alpha3(global.partexplode, 1.0, 1.0, 0.0);
part_type_speed(global.partexplode, 0, 2.5, 0, 0);
part_type_direction(global.partexplode, 0, 359, 0, 0);
part_type_gravity(global.partexplode, 0, 270);
part_type_life(global.partexplode, 30, 60);
part_type_blend(global.partexplode, true);

global.partsmoke_sys = part_system_create();
part_system_layer(global.partsmoke_sys, "Effects");
global.partsmoke = part_type_create();
part_type_shape(global.partsmoke, pt_shape_pixel);
part_type_size(global.partsmoke, 1, 2, 0.1, 0);
part_type_alpha3(global.partsmoke, 1.0, 1.0, 0.0);
part_type_speed(global.partsmoke, 0, 0.1, 0, 0);
part_type_direction(global.partsmoke, 0, 359, 0, 0);
part_type_gravity(global.partsmoke, 0, 270);
part_type_life(global.partsmoke, 30, 60);
part_type_blend(global.partsmoke, true);