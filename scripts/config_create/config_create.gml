/// @desc Creates a configuration file with default values.
/// @ret config A default configuration ds_map.

// Create the ds_map.
var conf = ds_map_create();

// Language.
conf[? "language"]			 = os_get_language();

// Video.
conf[? "resolution"]		= 1;

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
conf[? "key_left"]			= ord("A");
conf[? "key_right"]			= ord("D");
conf[? "key_up"]			= ord("W");
conf[? "key_down"]			= ord("S");
conf[? "key_jump"]			= vk_space;

return conf;