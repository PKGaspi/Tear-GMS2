/// @description Control zoom, moovement and objective.
if (global.pause) exit;

// Zoom.
if (width != width_to || height != height_to) {
	// TO-DO: Make it work with real values (somehow).
	
	if (zoom_sp == 0) {
		// If the speed is zero, zoom instantly.
		width = width_to;
		height = height_to;
	}
	else {
		// Else, zoom at the given speed.
		width += sign(width_to - width) * 16 * zoom_sp;
		height += sign(height_to - height) * 9 * zoom_sp;
	}
	
	// Cap width and height to the room.
	if (abs(width) > room_width)		width	= sign(width)  * room_width;
	if (abs(height) > room_height)		height	= sign(height) * room_height;
	
	// Update projection matrix.
	var pm = matrix_build_projection_ortho(width, height, 1, 32000);
	camera_set_proj_mat(camera, pm);
	
}

// Movement.
if (follow != noone && instance_exists(follow)) {
	// Calculate new position.
	x_to = follow.x;
	y_to = follow.y;
	// Aplay camera delay.
	x	+= (x_to - x) / delay;
	y	+= (y_to - y) / delay;
	
	// Stay in place if the following instance goes beyond the limits of the room.
	if (x - abs(width) / 2 < 0)					x = abs(width) / 2;
	if (x + abs(width) / 2 > room_width)		x = room_width - abs(width) / 2;
	if (y - abs(height) / 2 < 0)				y = abs(height) / 2;
	if (y + abs(height) / 2 > room_height)		y = room_height - abs(height) / 2;
}

// Update view matrix.
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);