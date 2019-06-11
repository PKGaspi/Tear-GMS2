/// @description Movement and a lot more.
if (global.pause || global.cutscene) exit; // Finish if movement is not allowed.

// Inputs.
var h_input_h						= keyboard_check(global.key_right) - keyboard_check(global.key_left);
var v_input_h						= keyboard_check(global.key_down) - keyboard_check(global.key_up);
var run_input_h						= keyboard_check(global.key_run);

if (h_input_h != 0 || v_input_h != 0) {
	// Calculate direction.
	dir = point_direction(0, 0, h_input_h, v_input_h);
	x_move += lengthdir_x(h_speed, dir);
	y_move += lengthdir_y(v_speed, dir);
}

if (run_input_h) {
	x_move *= h_run_extra_speed;
	y_move *= v_run_extra_speed;
}

// Add movement. DO NOT TOUCH X AND Y ANYWHERE ELSE!!
x += x_move;
y += y_move;

// Reset movement at the end of each frame.
x_move = 0;
y_move = 0;