/// @desc Changes volume to a given value.
/// @arg New value.

var type = menu_option[page];

// TO-DO: Put testing sounds.

switch (type) {
	case 0: {
		global.master_volume = argument0;
		audio_master_gain(global.master_volume);
		break;
	}
	case 1: {
		global.music_volume = argument0;
		audio_group_set_gain(audiogroup_music, global.music_volume, 0);
		break;
	}
	case 2: {
		global.sound_volume = argument0;
		audio_group_set_gain(audiogroup_soundeffects, global.sound_volume, 0);
		break;
	}
}