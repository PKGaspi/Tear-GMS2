/// @description Movement and a lot more.
if (global.pause) exit; // Finish if movement is not allowed.
var bbox_side, table;

#region // Inputs.
if (!global.cutscene && !global.debug_menu) {
	var h_input_h		= keyboard_check(global.key_right) - keyboard_check(global.key_left);
	var v_input_h		= keyboard_check(global.key_down) - keyboard_check(global.key_up);
	var run_input_h		= keyboard_check(global.key_run);
	var jump_h			= keyboard_check(global.key_jump);
}
else {
	var h_input_h		= 0;
	var v_input_h		= 0;
	var run_input_h		= 0;
	var jump_h			= 0;
}
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
#region // Terrain collision.
// TODO: Make this work with the z axis.
// Horizontal collision.
if (x_move > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
var col_top = tilemap_get_at_pixel(tilemap, bbox_side + round(x_move), bbox_top);
var col_bottom = tilemap_get_at_pixel(tilemap, bbox_side + round(x_move), bbox_bottom);

// Ignore horizontal collision in case we are on a diagonal wall.
if (tilemap_get_at_pixel(tilemap, x, bbox_top) >1) col_top = 0;
if (tilemap_get_at_pixel(tilemap, x, bbox_bottom) > 1 ) col_bottom = 0;

if (col_top != 0 || col_bottom != 0) {
	if (x_move > 0) {
		x -= (x mod TILE_SIZE) - (TILE_SIZE - 1);
		x -= (bbox_right - x);	
	}
	else {
		x -= (x mod TILE_SIZE);
		x -= (bbox_left - x);
	}
	x_move = 0;
} 

// Vertical collision.

if (y_move > 0) {
	bbox_side = bbox_bottom;
	table = global.collision_heights_top;
}
else {
	bbox_side = bbox_top;
	table = global.collision_heights_bottom;
}

if (tilemap_get_at_pixel(tilemap, x, bbox_side + y_move) <= 1) {
	if (tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + round(y_move)) != 0 ||
		tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + round(y_move)) != 0) {
		if (y_move > 0) {
			y -= (y mod TILE_SIZE) - (TILE_SIZE - 1)
			y -= (bbox_bottom - y);
		}
		else {
			y -= (y mod TILE_SIZE);
			y -= (bbox_top - y);
		}
		y_move = 0;
	}
}
else {
	var dist = collision_get_distance(tilemap, x, bbox_side + y_move, table);
	if (dist > 0) {
		if (y_move > 0) {
			y_move = dist - y mod TILE_SIZE;
		}
		else {
			y_move = dist - y mod TILE_SIZE;
		}
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

if (global.cutscene) exit;
// Collisions.
#region // Loading box colision.
var box = instance_place(x, y, obj_parent_collision_box);
if (box != noone) {
	with (box) event_perform(ev_other, ev_user0);
}
#endregion