/// @desc Draws a triangle with a border and the given font size.
/// @arg0 x1
/// @arg1 y1
/// @arg2 x2
/// @arg3 y2
/// @arg4 x3
/// @arg5 y3
/// @arg6 border_color
/// @arg7 inside_color
/// @arg8 thickness

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var x3 = argument4;
var y3 = argument5;

var c_border = argument6;
var c_inside = argument7;

var thickness = argument8;
var offset = thickness / 2;

// Draw outline.
draw_triangle_color(x1 - offset, y1 - offset, x2 - offset, y2 - offset, x3 - offset, y3 - offset, c_border, c_border, c_border, false);
draw_triangle_color(x1 + offset, y1 - offset, x2 + offset, y2 - offset, x3 + offset, y3 - offset, c_border, c_border, c_border, false);
draw_triangle_color(x1 - offset, y1 + offset, x2 - offset, y2 + offset, x3 - offset, y3 + offset, c_border, c_border, c_border, false);
draw_triangle_color(x1 + offset, y1 + offset, x2 + offset, y2 + offset, x3 + offset, y3 + offset, c_border, c_border, c_border, false);

// Draw inside.

draw_triangle_color(x1, y1, x2, y2, x3, y3, c_inside, c_inside, c_inside, false);