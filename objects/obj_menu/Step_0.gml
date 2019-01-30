/// @description Move the selection.

var input_esc_p = keyboard_check_pressed(vk_escape);
if (input_esc_p) {
	page = 0;
	global.pause = !global.pause;
	if (global.pause) {
		var i = 0;
		var array_len = array_length_1d(menu_pages);
		repeat (array_len) {
			menu_option[i] = 0;
			i++;
		}
	}
}

if (!global.pause) exit;

input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p	= keyboard_check_pressed(global.key_down);
input_left_p	= keyboard_check_pressed(global.key_left);
input_left_h	= keyboard_check(global.key_left);
input_right_p	= keyboard_check_pressed(global.key_right);
input_right_h	= keyboard_check(global.key_right);
input_enter_p	= keyboard_check_pressed(global.key_accept);

var ds_grid		= menu_pages[page];
var ds_height	= ds_grid_height(ds_grid);

var v_move_p	= input_down_p - input_up_p;

if (v_move_p != 0) {
	menu_option[page] += v_move_p;
	if (menu_option[page] > ds_height - 1) menu_option[page] = 0; 
	if (menu_option[page] < 0) menu_option[page] = ds_height - 1;
}

else if (input_enter_p) {
	switch (ds_grid[# 2, menu_option[page]]) {
		case menu_element_type.script_runner: {
			script_execute(ds_grid[# 3, menu_option[page]]);
			break;
		}
		case menu_element_type.page_transfer: {
			var menu_entry = menu_option[page];
			if (menu_entry == ds_height - 1) { // If it's the last entry.
				config_save();
				menu_option[page] = 0; // Don't save back as previous entry.
			}
			page = ds_grid[# 3, menu_entry];
			break;
		}
		case menu_element_type.toggle: {
			ds_grid[# 4, menu_option[page]] = !ds_grid[# 4, menu_option[page]];
			script_execute(ds_grid[# 3, menu_option[page]]);
			break;
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
			current_val = current_val + sign(h_move_h) * abs(current_array[0] - current_array[1]) / 100;
			ds_grid[# 4, menu_option[page]] = clamp(current_val, current_array[0], current_array[1]);
			script_execute(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]);
			break;
		}
	}
}

if (h_move_p != 0) {
	switch (ds_grid[# 2, menu_option[page]]) {
		case menu_element_type.shift: {
			var current_val = ds_grid[# 4, menu_option[page]];
			var current_array = ds_grid[# 5, menu_option[page]];
			ds_grid[# 4, menu_option[page]] = clamp(current_val + h_move_p, 0, array_length_1d(current_array) - 1);
			script_execute(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]);
			break;
		}
	}
}
