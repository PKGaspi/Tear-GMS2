/// @desc Draws a text with a border and the given font size.
/// @arg0 x1
/// @arg1 y1
/// @arg2 x2
/// @arg3 y2
/// @arg4 width
/// @arg5 border_color
/// @arg6 inside_color
/// @arg7 thickness

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var w = argument4;

var c_border = argument5;
var c_inside = argument6;

var thickness = argument7;
var offset = thickness / 5;

// Draw outline.
draw_line_width_color(x1 + offset, y1, x2 + offset, y2, w, c_border, c_border);
draw_line_width_color(x1 - offset, y1, x2 - offset, y2, w, c_border, c_border);
draw_line_width_color(x1, y1 + offset, x2, y2 + offset, w, c_border, c_border);
draw_line_width_color(x1, y1 - offset, x2, y2 - offset, w, c_border, c_border);

// Draw inside.
draw_line_width_color(x1, y1, x2, y2, w, c_inside, c_inside);