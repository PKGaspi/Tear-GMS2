/// @description Initialize everything.

// Load audio groups.
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);

// Control variables.
global.pause				= false;
global.cutscene				= false;

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
global.c_purple_0			= $952f5d;
var c_hue					= color_get_hue(global.c_purple_0);
var c_sat					= color_get_saturation(global.c_purple_0);
var c_val					= color_get_value(global.c_purple_0);
global.c_purple_1			= make_color_hsv(c_hue, c_sat + 50, c_val);

// Load configuration.
config_load();

// Setup camera, menu object and draw object.
instance_create_layer(x, y, "Hidden", obj_camera);
instance_create_layer(x, y, "Hidden", obj_menu);
instance_create_layer(x, y, "Hidden", obj_draw);

alarm[0] = 2; // Fixes fullscreen to window size.
// */