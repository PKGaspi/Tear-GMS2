/// @desc Changes volume to a given value.
/// @arg New value.

var type = menu_option[page];

// TO-DO: Add testing sounds.

switch (type) {
	case 0: {
		global.master_volume = argument0;
		break;
	}
	case 1: {
		global.music_volume = argument0;
		break;
	}
	case 2: {
		global.sound_volume = argument0;
	}
}

set_volume();