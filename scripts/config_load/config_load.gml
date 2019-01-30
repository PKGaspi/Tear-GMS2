/// @desc Loads all config into global variables.
// Read the confug file.
ini_open("config.ini");

// Language.
global.language				= ini_read_string("language", "language", os_get_language());

// Video.
global.resolution			= ini_read_real("video", "resolution", 1);
global.display_width		= display_get_width();
global.display_height		= display_get_height();
global.resolutions[0, 0]	= global.display_width / 4;
global.resolutions[0, 1]	= global.display_width / 3;
global.resolutions[0, 2]	= global.display_width / 2;
global.resolutions[0, 3]	= global.display_width / 1.5;
global.resolutions[0, 4]	= global.display_width / 1.2;
global.resolutions[1, 0]	= global.display_height / 4;
global.resolutions[1, 1]	= global.display_height / 3;
global.resolutions[1, 2]	= global.display_height / 2;
global.resolutions[1, 3]	= global.display_height / 1.5;
global.resolutions[1, 4]	= global.display_height / 1.2;
global.fullscreen			= bool(ini_read_real("video", "fullscreen", false));

global.antialiasing			= ini_read_real("video", "antialiasing", 0);
global.vsync				= bool(ini_read_real("video", "vsync", true));
switch (display_aa) {
	case 2: global.antialiasing_values = [0, 2]; break;	
	case 6: global.antialiasing_values = [0, 2, 4]; break;	
	case 12: global.antialiasing_values = [0, 4, 8]; break;	
	case 14: global.antialiasing_values = [0, 2, 4, 8]; break;
	default: global.antialiasing_values = [0]; break;
}

// Audio.
global.master_volume		= clamp(ini_read_real("audio", "master_volume", .5), 0, 1);
global.music_volume			= clamp(ini_read_real("audio", "music_volume", .75), 0, 1);
global.sound_volume			= clamp(ini_read_real("audio", "sound_volume", .75), 0, 1);
global.audio_muted			= bool(ini_read_real("audio", "audio_muted", false));

// Control.
global.key_run				= ini_read_real("control", "run", vk_control);
global.key_accept			= ini_read_real("control", "accept", vk_enter);
global.key_left				= ini_read_real("control", "left", vk_left);
global.key_right			= ini_read_real("control", "right", vk_right);
global.key_up				= ini_read_real("control", "up", vk_up);
global.key_down				= ini_read_real("control", "down", vk_down);

ini_close();

// Apply changes if any.
window_set_fullscreen(global.fullscreen);
set_resolution(global.resolution);
set_antialiasing(global.antialiasing);
audio_master_gain(global.master_volume);
audio_group_set_gain(audiogroup_music, global.music_volume, 0);
audio_group_set_gain(audiogroup_soundeffects, global.sound_volume, 0);