/// @desc Saves all config into a ini file.

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
ds_map_secure_save(global.config, "config.ini");

/*
// Write changes if any.
ini_open("config.ini");

// Language.
ini_write_string("language", "language", global.language);

// Video.
ini_write_real("video", "resolution", global.resolution);
ini_write_real("video", "antialiasing", global.antialiasing);
ini_write_real("video", "vsync", global.vsync);
ini_write_real("video", "fullscreen", global.fullscreen);

// Audio.
ini_write_real("audio", "master_volume", global.master_volume);
ini_write_real("audio", "music_volume", global.music_volume);
ini_write_real("audio", "sound_volume", global.sound_volume);
ini_write_real("audio", "audio_muted", global.audio_muted);

// Control.
ini_write_real("control", "run", global.key_run);
ini_write_real("control", "accept", global.key_accept);
ini_write_real("control", "left", global.key_left);
ini_write_real("control", "right", global.key_right);
ini_write_real("control", "up", global.key_up);
ini_write_real("control", "down", global.key_down);

ini_close();

// */