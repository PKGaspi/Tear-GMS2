/// @desc Draws a window in the given position with the given colors and a background.
/// @arg0 x1 The x position of the left border of the window.
/// @arg1 y1 The y position of the top border of the window.
/// @arg2 x2 The x position of the right border of the window.
/// @arg3 y2 The y position of the bottom border of the window.
/// @arg4 border_scale The scale of the border.
/// @arg5 color_border The color of the border.
/// @arg6 color_inside The color of the inside.
/// @arg7 color_back The color of the back.
/// @arg8 back_alpha The alpha of the back.

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var border_scale = argument4;

var c_border = argument5;
var c_inside = argument6;
var c_back = argument7;

var back_alpha = argument8;

// Save old color and alpha.
var c_old = draw_get_color();
var a_old = draw_get_alpha();

// Background.
draw_set_alpha(back_alpha);
draw_set_color(c_back);
draw_rectangle(0, 0, global.view_width, global.view_height, false);

// Window.
draw_window(x1, y1, x2, y2, border_scale, c_border, c_inside);

// Restore old color and alpha.
draw_set_color(c_old);
draw_set_alpha(a_old);