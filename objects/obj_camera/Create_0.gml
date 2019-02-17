/// @description Camera values initialization.

// Setting up the camera.
view_enabled					= true;
view_visible[0]					= true;

global.view_width				= global.intended_width;
global.view_height				= global.intended_height;
width							= global.view_width;
height							= global.view_height;
width_to						= width;
height_to						= height;

x								= global.view_width / 2;
y								= global.view_height / 2;

global.draw_ratio				= global.view_width / global.intended_width;

global.camera					= camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(global.view_width, global.view_height, 1, 32000);

camera_set_view_mat(global.camera, vm);
camera_set_proj_mat(global.camera, pm);

view_camera[0] = global.camera;

// Setting up zoom and camera movement.
follow							= noone;
x_to							= x;
y_to							= y;
delay							= 1;		// Don't go lower than 1.
zoom							= 1;
zoom_sp							= 0;

// Setting up the game window and application surface.
// window_resize(global.display_width / 2, global.display_height / 2);
surface_resize(application_surface, global.display_width, global.display_height);

display_set_gui_size(global.view_width, global.view_height);
alarm[0] = 1; // Set v-sync and aa.

/*

// #-#-#-#-# OLD CAMERA SYSTEM #-#-#-#-#


view_enabled					= true;
view_visible[0]					= true;

view_xport[0]					= 0;
view_yport[0]					= 0;
view_wport[0]					= 240;
view_hport[0]					= 135;

view_camera[0]					= camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, view_wport[0] / 4, view_hport[0] / 4);

global.camera					= view_camera[0];
global.view_width				= camera_get_view_width(global.camera);
global.view_height				= camera_get_view_height(global.camera);

follow							= noone;

if (instance_exists(obj_player)) {
	camera_set_view_target(global.camera, obj_player);
}

window_resize(global.display_width / 2, global.display_height / 2);
surface_resize(application_surface, global.display_width, global.display_height);

display_set_gui_size(global.view_width, global.view_height);
alarm[0] = 1; // Set v-sync and aa.

// */