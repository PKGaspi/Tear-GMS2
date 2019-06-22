/// @desc Loads all config into global variables.

// Copy config into global.config ds map.
config_open();

//ini_open("config.ini");

// Language.
global.language				= global.config[? "language"];

// Video.
global.resolution			= global.config[? "resolution"];

global.fullscreen			= global.config[? "fullscreen"];

global.antialiasing			= global.config[? "antialiasing"];
global.vsync				= global.config[? "vsync"];

// Audio.
global.master_volume		= clamp(global.config[? "master_volume"], 0, 100);
global.music_volume			= clamp(global.config[? "music_volume"], 0, 100);
global.sound_volume			= clamp(global.config[? "sound_volume"], 0, 100);
global.audio_muted			= bool(global.config[? "audio_muted"]);

// Control.
global.key_run				= global.config[? "key_run"];
global.key_accept			= global.config[? "key_accept"];
global.key_left				= global.config[? "key_left"];
global.key_right			= global.config[? "key_right"];
global.key_up				= global.config[? "key_up"];
global.key_down				= global.config[? "key_down"];

ds_map_destroy(global.config);

// Apply changes if any.
window_set_fullscreen(global.fullscreen);
set_resolution(global.resolution);
set_antialiasing(global.antialiasing);
audio_master_gain(global.master_volume);
audio_group_set_gain(audiogroup_music, global.music_volume, 0);
audio_group_set_gain(audiogroup_soundeffects, global.sound_volume, 0);