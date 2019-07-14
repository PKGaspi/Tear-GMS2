/// @desc Draws a text with the given color and font size.
/// @arg0 x
/// @arg1 y
/// @arg2 string
/// @arg3 color
/// @arg4 size Font size to draw the text with.

var _x = argument0;
var _y = argument1;
var text = argument2;
var c = argument3;
var size = argument4;

var scale = (size / 1000) * (global.view_width / font_get_size(draw_get_font()));
draw_text_transformed_color(_x, _y, text, scale, scale, 0, c, c, c, c, 1);