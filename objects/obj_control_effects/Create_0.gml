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
