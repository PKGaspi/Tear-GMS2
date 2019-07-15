/// @description Initialize everything.

// Destroy if there is another instance of this object.
event_inherited();
destroy = false;

// Load audio groups.
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);

// Control variables.
global.pause				= false; // Whether the game is paused or not.
global.cutscene				= false; // Whether a cutscene is running or not.
global.debug_menu			= false; // Whether the debug menu is active or not.
global.hacked				= false; // Whether some secure file is modified or not.
global.cameras				= array_create(0); // Cameras array.

// Video constants.
global.INTENDED_WIDTH		= 240;
global.INTENDED_HEIGHT		= 135;
global.DISPLAY_WIDTH		= display_get_width();
global.DISPLAY_HEIGHT		= display_get_height();

global.RESOLUTIONS[0, 0]	= global.DISPLAY_WIDTH / 4;
global.RESOLUTIONS[0, 1]	= global.DISPLAY_WIDTH / 3;
global.RESOLUTIONS[0, 2]	= global.DISPLAY_WIDTH / 2;
global.RESOLUTIONS[0, 3]	= global.DISPLAY_WIDTH / 1.5;
global.RESOLUTIONS[0, 4]	= global.DISPLAY_WIDTH / 1.2;
global.RESOLUTIONS[1, 0]	= global.DISPLAY_HEIGHT / 4;
global.RESOLUTIONS[1, 1]	= global.DISPLAY_HEIGHT / 3;
global.RESOLUTIONS[1, 2]	= global.DISPLAY_HEIGHT / 2;
global.RESOLUTIONS[1, 3]	= global.DISPLAY_HEIGHT / 1.5;
global.RESOLUTIONS[1, 4]	= global.DISPLAY_HEIGHT / 1.2;

var tmp;
switch (display_aa) {
	case 2 : tmp = [0, 2]; break;	
	case 6 : tmp = [0, 2, 4]; break;	
	case 12: tmp = [0, 4, 8]; break;	
	case 14: tmp = [0, 2, 4, 8]; break;
	default: tmp = [0]; break;
}
global.ANTIALIASING_VALUES	= tmp;

// Color variables.
global.c_purple_0				= color_change_endianness($ab47bc);
global.c_deep_purple_0			= color_change_endianness($311b92);
global.c_deep_purple_1			= color_change_endianness($000063);

// Load configuration.
config_load();

// Setup camera, menu object and draw object.
instance_create_layer(x, y, "Hidden", obj_camera);
instance_create_layer(x, y, "Hidden", obj_menu);
instance_create_layer(x, y, "Hidden", obj_draw);

alarm[0] = 2; // Fixes fullscreen to window size.

// */