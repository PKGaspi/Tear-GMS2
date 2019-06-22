/// @desc Creates a configuration file with default values.

conf = ds_map_create();

// Language.
conf[? "language"] = os_get_language();

// Video.
conf[? "resolution"] = 1;

conf[? "fullscreen"]		= false;
conf[? "antialiasing"]		= 0;
conf[? "vsync"]				= true;

// Audio.
conf[? "master_volume"]		= .5;
conf[? "music_volume"]		= .75;
conf[? "sound_volume"]		= .75;
conf[? "audio_muted"]		= false;

// Control.
conf[? "key_run"]			= vk_control;
conf[? "key_accept"]		= vk_enter;
conf[? "key_left"]			= vk_left;
conf[? "key_right"]			= vk_right;
conf[? "key_up"]			= vk_up;
conf[? "key_down"]			= vk_down;

return conf;