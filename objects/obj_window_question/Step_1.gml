/// @description Moving through the options and selecting.

if (!active) exit;

// Input reading.
var input_up_p		= keyboard_check_pressed(global.key_up);
var input_down_p	= keyboard_check_pressed(global.key_down);
var input_left_p	= keyboard_check_pressed(global.key_left);
var input_right_p	= keyboard_check_pressed(global.key_right);
var input_accept_p	= keyboard_check_pressed(global.key_accept);

var h_move_p		= input_right_p - input_left_p;

var actions_len		= array_length_1d(actions);

// Check if we change the menu entry selected.
if (h_move_p != 0) {
	selected += h_move_p;
	if (selected > actions_len - 1) selected = 0; 
	if (selected < 0) selected = actions_len - 1;
	// TO-DO: Add sound here.
}

// Make selected option bigger and unselected smaller over time.
var i = 0;
repeat (actions_len) {
	if (i == selected) {
		select_bump[i] = clamp(select_bump[i] + 1, 0, select_bump_cap);
	}
	else {
		select_bump[i] = clamp(select_bump[i] - 1, 0, select_bump_cap);
	}
	i++;
}

// Execute action.
if (input_accept_p) {
	script_execute(actions[selected]);
	instance_destroy(); // Closes the menu.
}