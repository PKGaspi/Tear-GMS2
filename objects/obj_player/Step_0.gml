/// @description Movement and a lot more.
if (global.pause || global.cutscene || global.debug_menu) exit; // Finish if movement is not allowed.

#region // Inputs.
var h_input_h						= keyboard_check(global.key_right) - keyboard_check(global.key_left);
var v_input_h						= keyboard_check(global.key_down) - keyboard_check(global.key_up);
var run_input_h						= keyboard_check(global.key_run);
var jump_h							= keyboard_check(global.key_jump);
#endregion
#region // Movement.
if (h_input_h != 0 || v_input_h != 0) {
	// Calculate direction.
	dir = point_direction(0, 0, h_input_h, v_input_h);
	x_move += lengthdir_x(move_speed, dir);
	y_move += lengthdir_y(move_speed, dir);
}
#endregion
#region // Run.
if (run_input_h) {
	x_move *= move_speed_run_multiplier;
	y_move *= move_speed_run_multiplier;
}
#endregion
#region // Jump.
if (z > 0) { // If in the air.
	z_move += grav;
	if (z_move > 0 && z_move < jump_speed + 4 * grav && !jump_h) z_move = 0;//max(0, z_move / 4);
	if (z < abs(z_move)) z_move = - z;
}
else {
	z = 0;
	z_move = 0;
	if (jump_h) { // Jump.
		z_move = jump_speed;
	}
}
#endregion
#region // Add movement. DO NOT TOUCH X AND Y ANYWHERE ELSE!!
x += x_move;
y += y_move - z_move;
z += z_move;
#endregion
#region // Reset movement at the end of each frame.
x_move = 0;
y_move = 0;
#endregion

// Collisions.
#region // Loading box colision.
var box = instance_place(x, y, obj_loading_zone);
if (box != noone) {
	with (box) event_perform(ev_other, ev_user0);
}
#endregion