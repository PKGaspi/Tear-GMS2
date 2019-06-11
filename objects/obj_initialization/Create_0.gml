/// @description Initialize everything.

// Load audio groups.
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);

// Control variables.
global.pause				= false;
global.cutscene				= false;

// Color variables.
global.c_purple_0			= $952f5d;
var c_hue					= color_get_hue(global.c_purple_0);
var c_sat					= color_get_saturation(global.c_purple_0);
var c_val					= color_get_value(global.c_purple_0);
global.c_purple_1			= make_color_hsv(c_hue, c_sat + 50, c_val);

// Load configuration.
config_load();
config_save();

// Setup camera, menu object and draw object.
instance_create_layer(x, y, "Hidden", obj_camera);
instance_create_layer(x, y, "Hidden", obj_menu);
instance_create_layer(x, y, "Hidden", obj_draw);

alarm[0] = 2; // Fixes fullscreen to window size.
// */