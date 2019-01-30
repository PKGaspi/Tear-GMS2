/// @description Control zoom, moovement and objective.
if (global.pause) exit;

// Zoom.
if (width != width_to || height != height_to) {
	// TO-DO: Make it work with real values (somehow).
	
	if (zoom_sp == 0) {
		width = width_to;
		height = height_to;
	}
	else {
		width += sign(width_to - width) * 16 * zoom_sp;
		height += sign(height_to - height) * 9 * zoom_sp;
	}
	
	var pm = matrix_build_projection_ortho(width, height, 1, 32000);
	camera_set_proj_mat(global.camera, pm);
	
}

// Movement.
if (follow != noone) {
	var follow_x = follow.x;
	var follow_y = follow.y;
	if (!(follow_x - width / 2 <= 0 || follow_x + width / 2 >= room_width)) x_to = follow_x;
	if (!(follow_y - height / 2 <= 0 || follow_y + height / 2 >= room_height)) y_to = follow_y;
	x += (x_to - x) / delay;
	y += (y_to - y) / delay;
	
	// In case the camera goes beyond the boundries of the room.
	if (x - width / 2 < 0) x = width / 2;
	if (x + width / 2 > room_width) x = room_width - width / 2;
	if (y - height / 2 < 0) y = height / 2;
	if (y + height / 2 > room_height) y = room_height - height / 2;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(global.camera, vm);