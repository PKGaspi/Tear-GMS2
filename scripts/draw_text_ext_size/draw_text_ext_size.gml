/// @desc Draws a text with the given font size inside the given area.
/// @arg0 x
/// @arg1 y
/// @arg2 string
/// @arg3 sep The distance in pixels between lines of text.
/// @arg4 w The maximum width in pixels of the string before a line break.
/// @arg5 size Font size to draw the text with.

// Get arguments
var _x = argument0;
var _y = argument1;
var text = argument2;
var size = argument5;

// Calculate scale and apply it to the width and separation.
var scale = size / font_get_size(draw_get_font());
var sep = argument3 / scale;
var w = argument4 / scale;

// Draw the text.
draw_text_ext_transformed(_x, _y, text, sep, w, scale, scale, 0);