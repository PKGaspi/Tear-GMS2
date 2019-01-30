/// @desc Draws a window in the given position with the given colors.
/// @arg0 x1 The x position of the left border of the window.
/// @arg1 y1 The y position of the top border of the window.
/// @arg2 x2 The x position of the right border of the window.
/// @arg3 y2 The y position of the bottom border of the window.
/// @arg4 border_scale The scale of the border.
/// @arg5 back_color The color of the back.
/// @arg6 border_color The color of the border.
/// @arg7 inside_color The color of the inside.
/// @arg8 back_alpha The alpha of the back.

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

// Translucid background.
draw_set_alpha(argument8);
draw_set_color(argument5);
draw_rectangle(0, 0, global.view_width, global.view_height, false);

// Purple interior.
draw_set_alpha(1);
draw_set_color(argument7);
draw_rectangle(x1 + argument4, y1 + argument4, x2 - 1 - argument4, y2 - 1 - argument4, false);

// White border.
draw_border(x1, y1, x2, y2, argument4, argument6);
