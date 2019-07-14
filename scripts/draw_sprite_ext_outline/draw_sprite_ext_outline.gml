/// @desc Draws a text with a border and the given font size.
/// @arg0 sprite
/// @arg1 subimage
/// @arg2 x
/// @arg3 y
/// @arg4 x_scale
/// @arg5 y_scale
/// @arg6 rot
/// @arg7 alpha
/// @arg8 border_color
/// @arg9 inside_color
/// @arg1 thickness

var sprite = argument0;
var subimage = argument1;

var _x = argument2;
var _y = argument3;

var x_scale = argument4;
var y_scale = argument5;
var rot = argument6;
var alpha = argument7;

var c_border = argument8;
var c_inside = argument9;

var thickness = argument10;
var offset = thickness / 5;

// Draw outline.
draw_sprite_ext(sprite, subimage, _x + offset, _y, x_scale, y_scale, rot, c_border, alpha);
draw_sprite_ext(sprite, subimage, _x - offset, _y, x_scale, y_scale, rot, c_border, alpha);
draw_sprite_ext(sprite, subimage, _x, _y + offset, x_scale, y_scale, rot, c_border, alpha);
draw_sprite_ext(sprite, subimage, _x, _y - offset, x_scale, y_scale, rot, c_border, alpha);

// Draw inside.
draw_sprite_ext(sprite, subimage, _x, _y, x_scale, y_scale, rot, c_inside, alpha);