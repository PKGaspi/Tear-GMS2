/// @desc Draws a border of the given side.
/// @arg0 x1
/// @arg1 y1
/// @arg2 x2
/// @arg3 y2
/// @arg4 scale
/// @arg5 color_border

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var scale = argument4 * global.draw_ratio;
var c_border = argument5;

var width = sprite_get_width(spr_border) * scale;
var height = sprite_get_height(spr_border) * scale;

// Top left.
draw_sprite_ext(spr_border, 0, x1, y1, scale, scale, 0, c_border, 1);
draw_sprite_ext(spr_border, 1, x1 + width, y1, (((x2 - x1) / width) - 2) * scale, scale, 0, c_border, 1);

// Top right.
draw_sprite_ext(spr_border, 0, x2, y1, scale, scale, 270, c_border, 1);
draw_sprite_ext(spr_border, 1, x2, y1 + height, (((y2 - y1) / width) - 2) * scale, scale, 270, c_border, 1);

// Bottom right.
draw_sprite_ext(spr_border, 0, x2, y2, scale, scale, 180, c_border, 1);
draw_sprite_ext(spr_border, 1, x2 - width, y2, (((x2 - x1) / height) - 2) * scale, scale, 180, c_border, 1);

// Bottom left.
draw_sprite_ext(spr_border, 0, x1, y2, scale, scale, 90, c_border, 1);
draw_sprite_ext(spr_border, 1, x1, y2 - height, (((y2 - y1) / height) - 2) * scale, scale, 90, c_border, 1);
