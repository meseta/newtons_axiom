/// @description Cotrol inputs

if(global.game_data[? "score"] > global.highscore) global.highscore = global.game_data[? "score"];

var key_esc = keyboard_check_released(vk_escape);
if(key_esc) {
	room_goto(rm_menu);	
}

if(not instance_exists(control_target)) {
	control_target = scr_closest_player_mothership(x, y);
	
	if(control_target == noone) {
		gameover_timer += 1
		global.game_data[? "metals"] = 0;
		global.game_data[? "parts"] = 0;
		global.game_data[? "gameover"] = true;
		if(gameover_timer > 100) {
			global.myscore = global.game_data[? "score"];
			room_goto(rm_gameover);
		}
	}
}

if(instance_exists(control_target)) {
	var mouse_timeout = 90;

	var key_right = max(keyboard_check(vk_right), keyboard_check(ord("D")), 0);
	var key_left = max(keyboard_check(vk_left), keyboard_check(ord("A")), 0);
	var key_down = max(keyboard_check(vk_down), keyboard_check(ord("S")), 0);
	var key_up = max(keyboard_check(vk_up), keyboard_check(ord("W")), 0);
	
	var key_primary = max(keyboard_check(vk_space), mouse_check_button(mb_left));
	var key_secondary = max(keyboard_check(vk_shift), mouse_check_button(mb_right));

	/*hotkey[0] = max(keyboard_check_released(ord("0")), 0);
	hotkey[1] = max(keyboard_check_released(ord("1")), 0);
	hotkey[2] = max(keyboard_check_released(ord("2")), 0);
	hotkey[3] = max(keyboard_check_released(ord("3")), 0);
	hotkey[4] = max(keyboard_check_released(ord("4")), 0);
	hotkey[5] = max(keyboard_check_released(ord("5")), 0);
	hotkey[6] = max(keyboard_check_released(ord("6")), 0);
	hotkey[7] = max(keyboard_check_released(ord("7")), 0);
	hotkey[8] = max(keyboard_check_released(ord("8")), 0);
	hotkey[9] = max(keyboard_check_released(ord("9")), 0);
	
	hotkey_r = max(keyboard_check_released(vk_tab), mouse_wheel_down(), 0);
	hotkey_l = max(mouse_wheel_up(), 0);*/

	var axis_x = (key_right - key_left);
	var axis_y = (key_down - key_up);

	// mouse aim
	if(window_mouse_get_x() == last_mouse_x and window_mouse_get_y() == last_mouse_y) {
		last_mouse_timeout += 1;
	}
	else {
		last_mouse_x = window_mouse_get_x();
		last_mouse_y = window_mouse_get_y();
		last_mouse_timeout = 0;	
	}

	if(last_mouse_timeout < mouse_timeout) {
		control_target.aim_dir = point_direction(control_target.x, control_target.y, mouse_x, mouse_y);
	}

	// Gamepad Input
	if(gamepad_is_connected(0)) {
		gamepad_set_axis_deadzone(0, 0.1);
		key_right = 	max(key_right, gamepad_button_check(0, gp_padr), 0);
		key_left = 	max(key_left, gamepad_button_check(0, gp_padl), 0);
		key_down = 	max(key_down, gamepad_button_check(0, gp_padd), 0);
		key_up = 	max(key_up, gamepad_button_check(0, gp_padu), 0);
	
		key_primary = 	max(key_primary, gamepad_button_check(0, gp_face1), gamepad_button_check(0, gp_shoulderr), 0);
		key_secondary = 	max(key_secondary, gamepad_button_check(0, gp_face2), gamepad_button_check(0, gp_shoulderl), 0);
	
		/*hotkey_r = 	gamepad_button_check_released(0, gp_shoulderrb);
		hotkey_l = 	gamepad_button_check_released(0, gp_shoulderlb);*/
	
		axis_x += gamepad_axis_value(0, gp_axislh);
		axis_y += gamepad_axis_value(0, gp_axislv);
	
		// gamepad aim
		var axis_u = gamepad_axis_value(0, gp_axisrh);
		var axis_v = gamepad_axis_value(0, gp_axisrv);
		if(axis_u != 0 or axis_v != 0) { // right stick axis are set
			control_target.aim_dir = point_direction(0, 0, axis_u, axis_v);
		}
	}

	control_target.act_primary = key_primary;
	control_target.act_secondary = key_secondary;
	control_target.move_dir = point_direction(0, 0, axis_x, axis_y);
	control_target.move_amount = min(1.0, point_distance(0, 0, axis_x, axis_y));
}