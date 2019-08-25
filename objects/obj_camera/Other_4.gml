/// @description Reload values when entering a room.
// Enable views.
view_enabled = true;

// Update the matrixes.
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
var pm = matrix_build_projection_ortho(width, height, 1, 32000);
camera_set_proj_mat(camera, pm);

// Set this camera's view as visible and set the camera to it..
view_set_visible(camera_index, true);
view_set_camera(camera_index, camera);

// Set collision as visible if in debug mode.
if (layer_exists("Collision")) {
	layer_set_visible("Collision", debug_mode);
}