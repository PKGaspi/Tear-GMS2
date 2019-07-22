/// @desc Draws a circle with a border and the given size.
/// @arg0 x
/// @arg1 y
/// @arg2 r
/// @arg3 border_color
/// @arg4 inside_color
/// @arg5 thickness

var _x = argument0;
var _y = argument1;
var r = argument2;

var c_border = argument3;
var c_inside = argument4;

var thickness = argument5;

// Draw outline.
draw_circle_color(_x, _y, r + thickness, c_border, c_border, false);

// Draw inside.
draw_circle_color(_x, _y, r, c_inside, c_inside, false);