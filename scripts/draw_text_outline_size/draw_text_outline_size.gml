/// @desc Draws a text with a border and the given font size.
/// @arg0 x
/// @arg1 y
/// @arg2 string
/// @arg3 border_color
/// @arg4 inside_color
/// @arg5 thickness
/// @arg6 size Font size to draw the text with.

var _x = argument0;
var _y = argument1;

var text = argument2;

var c_border = argument3;
var c_inside = argument4;

var thickness = argument5;
var size = argument6;
var offset = thickness / 5;

// Draw outline.
draw_text_color_size(_x + offset, _y, text, c_border, size);
draw_text_color_size(_x - offset, _y, text, c_border, size);
draw_text_color_size(_x, _y + offset, text, c_border, size);
draw_text_color_size(_x, _y - offset, text, c_border, size);

// Draw inside.
draw_text_color_size(_x, _y, text, c_inside, size);