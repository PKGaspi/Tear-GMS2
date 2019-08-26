/// @description Camera values initialization.
event_inherited();

// Destroy if there is another instance of this object.

// Setting up the camera.

global.view_width				= global.INTENDED_WIDTH;
global.view_height				= global.INTENDED_HEIGHT;
width							= global.view_width;
height							= global.view_height;
width_to						= width;
height_to						= height;

camera							= camera_create();
camera_index					= array_length_1d(global.cameras);
global.cameras[camera_index]	= self;

// Destroy the camera that is going to be replaced.
camera_destroy(view_camera[camera_index]);

// Setting up zoom and camera movement.
follow							= noone;
x_to							= x;
y_to							= y;
delay							= 1; // Don't go lower than 1.
zoom							= 1;
zoom_sp							= 0;

// Setting up screenshake.
shake_length = 0; // Length of the shake in steps.
shake_level = 0; // Magniude of the shake in pixels.
shake_remain = 0;

// Setting up the game window and application surface.
surface_resize(application_surface, global.DISPLAY_WIDTH, global.DISPLAY_HEIGHT);

display_set_gui_size(global.view_width, global.view_height);
alarm[0] = 1; // Set v-sync and aa.
