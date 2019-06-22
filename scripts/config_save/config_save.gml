/// @desc Saves all config into a ini file.

// Copy config into global.config ds map.
config_open();

// Language.
global.config[? "language"]			= global.language;

// Video.
global.config[? "resolution"]		= global.resolution;

global.config[? "fullscreen"]		= global.fullscreen;

global.config[? "antialiasing"]		= global.antialiasing;
global.config[? "vsync"]			= global.vsync;

// Audio.
global.config[? "master_volume"]	= clamp(global.master_volume, 0, 100);
global.config[? "music_volume"]		= clamp(global.music_volume, 0, 100);
global.config[? "sound_volume"]		= clamp(global.sound_volume, 0, 100);
global.config[? "audio_muted"]		= global.audio_muted;

// Control.
global.config[? "key_run"]			= global.key_run;
global.config[? "key_accept"]		= global.key_accept;
global.config[? "key_left"]			= global.key_left;
global.config[? "key_right"]		= global.key_right;
global.config[? "key_up"]			= global.key_up;
global.config[? "key_down"]			= global.key_down;

// Save into ecrypted file.
ds_map_secure_save(global.config, "config.dat");
ds_map_destroy(global.config);
