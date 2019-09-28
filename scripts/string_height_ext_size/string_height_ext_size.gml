/// @desc returns the height of a string with the given max_width, separation and font size.
/// @arg0 string
/// @arg1 sep
/// @arg2 w
/// @arg3 size

var scale = argument3 / font_get_size(draw_get_font());
return string_height_ext(argument0, argument1, argument2 / scale) * scale;