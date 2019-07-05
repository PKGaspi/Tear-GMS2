/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
view_enabled					= true;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(global.view_width, global.view_height, 1, 32000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_set_visible(camera_index, true);
view_set_camera(camera_index, camera);