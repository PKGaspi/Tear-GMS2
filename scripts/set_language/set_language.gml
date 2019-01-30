/// @desc Changes the language to the given value.
/// @arg0 language Language to change to.
switch (get_language_num(argument0)) {
	case 1: global.language = "es"; break;
	default: global.language = "en"; break;
}