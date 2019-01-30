/// @description Initialize everything.

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);

global.pause				= false;
global.c_purple_0			= $952f5d;

config_load();
config_save();

instance_create_layer(x, y, "Hidden", obj_camera);
instance_create_layer(x, y, "Hidden", obj_menu);
instance_create_layer(x, y, "Hidden", obj_draw);

alarm[0] = 2; // Fixes fullscreen to window size.
// */