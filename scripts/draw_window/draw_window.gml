/// @desc Draws a window in the given position with the given colors.
/// @arg0 x1 The x position of the left border of the window.
/// @arg1 y1 The y position of the top border of the window.
/// @arg2 x2 The x position of the right border of the window.
/// @arg3 y2 The y position of the bottom border of the window.
/// @arg4 border_scale The scale of the border.
/// @arg5 color_border The color of the border.
/// @arg6 colot_inside The color of the inside.

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var border_scale = argument4;

var c_border = argument5;
var c_inside = argument6;

// Save old color and alpha.
var c_old = draw_get_color();
var a_old = draw_get_alpha();

// Inside.
draw_set_color(c_inside);
draw_set_alpha(1);
draw_rectangle(x1 + global.draw_ratio, y1 + global.draw_ratio, x2 - global.draw_ratio - border_scale, y2 - global.draw_ratio - border_scale, false);

// White border.
draw_border(x1, y1, x2, y2, border_scale, c_border);

// Restore old color and alpha.
draw_set_color(c_old);
draw_set_alpha(a_old);