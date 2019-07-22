/// @desc Draws a triangle with a border and the given font size.
/// @arg0 x1 The x of the spike end (near speaker mouth).
/// @arg1 y The y of the spike end (near speaker mouth).
/// @arg2 x2 The x of the bubble edge.
/// @arg3 height The height of the bubble side.
/// @arg4 border_color
/// @arg5 inside_color
/// @arg6 thickness

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = y1 - argument3 / 2;
var y3 = y1 + argument3 / 2;

var c_border = argument4;
var c_inside = argument5;

var thickness = argument6;
var offset = thickness / 2;

var factor = sign(x1 - x2);

// Draw outline.
draw_triangle_color(x1 + factor * 2 * offset, y1, x2, y2 - offset, x2, y3 + offset, c_border, c_border, c_border, false);

// Draw inside.

draw_triangle_color(x1, y1, x2, y2, x2, y3, c_inside, c_inside, c_inside, false);