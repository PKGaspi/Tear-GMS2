/// @description Movement and a lot more.
if (global.pause) exit; // Finish if movement is not allowed.
var bbox_side, bbox_center, table, width, height, dist, round_x, round_y;

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
round_x = false;
round_y = false;
if (h_input_h != 0 || v_input_h != 0) {
	// Calculate direction.
	// NOTE: Maybe the direction has to be recalculated somewhere.
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

// Vertical collision.
if (y_move > 0) {
	bbox_side = round(bbox_bottom + z + 1);
	table = global.collision_heights_top;
	height = collision_get_height(tilemap, x, bbox_side, table);
	if (height == TILE_SIZE) {
		// Check that tere is no collision on either side.
		height = min(collision_get_height(tilemap, bbox_left + 1, bbox_side, table),
					 collision_get_height(tilemap, bbox_right - 1, bbox_side, table));
	}
	dist = bbox_side mod TILE_SIZE - height;
}
else if (y_move < 0) {
	bbox_side = bbox_top + z;
	table = global.collision_heights_bottom;
	height = collision_get_height(tilemap, x, bbox_side, table);
	if (height == TILE_SIZE) {
		// Check that tere is no collision on either side.
		height = min(collision_get_height(tilemap, bbox_left + 1, bbox_side, table),
					 collision_get_height(tilemap, bbox_right - 1, bbox_side, table));
	}
	dist = TILE_SIZE - bbox_side mod TILE_SIZE - height - 1;
}

if (y_move != 0 && height != TILE_SIZE && abs(dist) < abs(y_move)) {
	// Stop movement due to a collision.
	y_move = dist;//dist;
	if (z == 0) {
		round_y = true;
	}
}

// Horizontal collision.
if (x_move > 0) {
	bbox_side = bbox_right;
	bbox_center = bbox_left + (bbox_right - bbox_left) / 2;
	table = global.collision_heights_left;
	width = collision_get_width(tilemap, bbox_side, y + z, table);
	if (width == TILE_SIZE) {
		// Check that tere is no collision on either side.
		width = min(collision_get_width(tilemap, bbox_side, bbox_top + 1 + z, table),
					collision_get_width(tilemap, bbox_side, bbox_bottom - 1 + z, table));
	}
	if (width != 0) {
		// Check the collision on the feet.
		bbox_side = bbox_left + (bbox_right - bbox_left) / 2; // The center of the collision.
		width = collision_get_width(tilemap, bbox_side, y + z, table);
	}
	dist = bbox_side mod TILE_SIZE - width;
}
else if (x_move < 0) {
	bbox_side = bbox_left;
	table = global.collision_heights_right;
	width = collision_get_width(tilemap, bbox_side, y + z, table);
	// TODO: Fix down collision not working while jumping.
	if (width == TILE_SIZE) {
		// Check that tere is no collision on either side.
		width = min(collision_get_width(tilemap, bbox_side, bbox_top + 1 + z, table),
					collision_get_width(tilemap, bbox_side, bbox_bottom - 1 + z, table));
	}
	if (width != 0) {
		// Check the collision on the feet.
		bbox_side = bbox_left + (bbox_right - bbox_left) / 2;
		width = collision_get_width(tilemap, bbox_side, y + z, table);
	}
	dist = TILE_SIZE - bbox_side mod TILE_SIZE - width - 1;
}

if (x_move != 0 && width != TILE_SIZE && abs(dist) < abs(x_move)) {
	// Stop movement due to a collision.
	x_move = dist;//sign(x_move) * abs(dist);
	round_x = true;
}

#endregion
#region // Add movement. DO NOT TOUCH X AND Y ANYWHERE ELSE!!

// Save previous values.
var x_prev = x;
var y_prev = y;
var z_prev = z;

// Add movement.
x += x_move;
y += y_move - z_move;
z += z_move;

// Round coordinates if it's said to.
if (round_x) {
	x = round(x);
}
if (round_y) {
	y = round(y);
}

// Calculate movement direction.
if (x_prev != x || y_prev + z_prev != y + z) {
	dir = round(point_direction(x_prev, y_prev + z_prev, x, y + z)) % 360;
}

#endregion
#region // Calculate animation state.
if (y_move == 0 && x_move == 0) character_set_animation(animation_state.iddle);
else if (!run_input_h) character_set_animation(animation_state.walk);
else if (run_input_h) character_set_animation(animation_state.run);
// Add jumping and more.
#endregion
#region // Reset movement at the end of each frame.
x_move = 0;
y_move = 0;
#endregion

if (global.cutscene) exit;
// Collisions.
#region // Loading box colision.
var box = instance_place(x, y + z, obj_parent_collision_box);
if (box != noone) {
	with (box) event_perform(ev_other, ev_user0);
}
#endregion