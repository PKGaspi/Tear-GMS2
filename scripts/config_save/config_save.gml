/// @desc Saves all config into a ini file.
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