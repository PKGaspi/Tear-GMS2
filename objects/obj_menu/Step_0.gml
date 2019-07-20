/// @description Move the selection.

var input_esc_p = keyboard_check_pressed(vk_escape);
if (input_esc_p) {
	global.pause = !global.pause;
	if (global.pause) {
		// TODO: Make a script and object for a window with animated background and handle it all in that object.

		audio_play_sound(snd_menu_enter, 1, false);
		// Clean the menu variables.
		page = 0;
		var i = 0;
		var array_len = array_length_1d(menu_pages);
		repeat (array_len) {
			menu_option[i] = 0;
			i++;
		}
		// Create animated window.
		var gwidth						= global.view_width;
		var gheight						= global.view_height;
		var x_window					= gwidth / 60;
		var y_window					= gwidth / 60;
		window = window_animated_create(spr_window_menu_inside_blue_gray, spr_window_menu_border_deep_purple,
		x_window, y_window, gwidth - x_window, gheight - y_window, false, 1.2, random_dir(), c_black, .7);
	}
	else {
		audio_play_sound(snd_menu_leave, 1, false);
		// Destroy animated window.
		instance_destroy(window, false);
	}
}

if (!global.pause) exit;

var input_up_p		= keyboard_check_pressed(global.key_up) || mouse_wheel_up();
var input_down_p	= keyboard_check_pressed(global.key_down) || mouse_wheel_down();
var input_left_p	= keyboard_check_pressed(global.key_left) || mouse_check_button_pressed(mb_left);
var input_left_h	= keyboard_check(global.key_left) || mouse_check_button(mb_left);
var input_right_p	= keyboard_check_pressed(global.key_right) || mouse_check_button_pressed(mb_right);
var input_right_h	= keyboard_check(global.key_right) || mouse_check_button(mb_right);
var input_enter_p	= keyboard_check_pressed(global.key_accept) || mouse_check_button_pressed(mb_left);
var input_run_h     = keyboard_check(global.key_run);

var v_move_p		= input_down_p - input_up_p;

var ds_grid			= menu_pages[page];
var ds_height		= ds_grid_height(ds_grid);

var ms_x = window_mouse_get_x();
var ms_y = window_mouse_get_y();

mouse_active = x_mouse_old != ms_x || y_mouse_old != ms_y;
x_mouse_old = ms_x;
y_mouse_old = ms_y;

if (v_move_p != 0) {
	audio_play_sound(snd_menu_move, 1, false);
	menu_option[page] += v_move_p;
	if (menu_option[page] > ds_height - 1) menu_option[page] = 0; 
	if (menu_option[page] < 0) menu_option[page] = ds_height - 1;
}

else if (input_enter_p) {
	switch (ds_grid[# 2, menu_option[page]]) {
		case menu_element_type.script_runner: {
			script_execute(ds_grid[# 3, menu_option[page]]);
			exit;
		}
		case menu_element_type.page_transfer: {
			var menu_entry = menu_option[page];
			if (menu_entry == ds_height - 1) { // If it's the last entry.
				audio_play_sound(snd_menu_leave, 1, false);
				config_save();
				menu_option[page] = 0; // Don't save back as previous entry.
			}
			else {
				audio_play_sound(snd_menu_enter, 1, false);
			}
			page = ds_grid[# 3, menu_entry];
			exit;
		}
		case menu_element_type.toggle: {
			ds_grid[# 4, menu_option[page]] = !ds_grid[# 4, menu_option[page]];
			script_execute(ds_grid[# 3, menu_option[page]]);
			exit;
		}
	}
}

var h_move_p = input_right_p - input_left_p;
var h_move_h = input_right_h - input_left_h;

if (h_move_h != 0) {
	switch (ds_grid[# 2, menu_option[page]]) {
		case menu_element_type.slider: {
			var current_val = ds_grid[# 4, menu_option[page]];
			var current_array = ds_grid[# 5, menu_option[page]];
			current_val += sign(h_move_p + h_move_h * input_run_h) * abs(current_array[0] - current_array[1]) / 100;
			ds_grid[# 4, menu_option[page]] = clamp(current_val, current_array[0], current_array[1]);
			script_execute(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]);
			exit;
		}
	}
}

if (h_move_p != 0) {
	switch (ds_grid[# 2, menu_option[page]]) {
		case menu_element_type.shift: {
			var new_val = ds_grid[# 4, menu_option[page]] + h_move_p;
			var current_array = ds_grid[# 5, menu_option[page]];
			var current_len = array_length_1d(current_array);
			
			if (0 <= new_val && new_val < current_len) {
				audio_play_sound(snd_menu_enter, 1, false);
			}
			else {
				audio_play_sound(snd_menu_leave, 1, false);
			}
			ds_grid[# 4, menu_option[page]] = clamp(new_val, 0, current_len - 1);
			script_execute(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]);
			exit;
		}
	}
}
