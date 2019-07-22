/// @desc Draws a roundrect with a border and the given size.
/// @arg0 x1
/// @arg1 y1
/// @arg2 x2
/// @arg3 y2
/// @arg4 border_color
/// @arg5 inside_color
/// @arg6 thickness

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var c_border = argument4;
var c_inside = argument5;

var thickness = argument6;
var offset = thickness / 2;

// Draw outline.
draw_roundrect_color(x1 - offset, y1 - offset, x2 + offset, y2 + offset, c_border, c_border, false);

// Draw inside.
draw_roundrect_color(x1, y1, x2, y2, c_inside, c_inside, false);