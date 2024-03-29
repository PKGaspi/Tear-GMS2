/// @desc Draws a window in the given position with the given window sprite.
/// @arg0 sprite Index of the sprite to draw.
/// @arg1 x1 The x position of the left border of the window.
/// @arg2 y1 The y position of the top border of the window.
/// @arg3 x2 The x position of the right border of the window.
/// @arg4 y2 The y position of the bottom border of the window.
/// @arg5 scale Whether to scale the sprites (true) or to draw them multiple times.

// Arguments.
var sprite = argument0;

if (sprite == noone) {
	exit;
}

var x1 = min(argument1, argument3);
var y1 = min(argument2, argument4);
var x2 = max(argument1, argument3);
var y2 = max(argument2, argument4);

var scale = argument5;

// The size of each tile.
var size = sprite_get_width(sprite) / 3;

// The width and height of the border.
var width = x2 - x1;
var height = y2 - y1;

// The numbers of whole columns and rows to draw.
var columns = width div size;
var rows = height div size;

// The size of the small extra collumn and/or row.
// They will be drawn by making each collumn and/or 
// row a little bit larger.
var extra_column = width % size;
var extra_row = height % size;

// Scale in case the drawing is made streched.
var x_scale = columns - 2 + extra_column / size;
var y_scale = rows - 2 + extra_row / size;

// Small scale in case there is an extra column and/or row.
if (scale) {
	var x_scale_tile = 1;
	var y_scale_tile = 1;
}
else {
	var x_scale_tile = x_scale / (columns - 2);
	var y_scale_tile = y_scale / (rows - 2);
}

// ----- DRAWING ------
draw_set_alpha(1);

// Draw the border.
draw_border(sprite, x1, y1, x2, y2, scale);

// --- MIDDLE ---
if (scale) {
	// Middle center.
	draw_sprite_part_ext(sprite, 0, size, size, size, size, x1 + size * x_scale_tile, y1 + size * y_scale_tile, x_scale, y_scale, c_white, 1);
}
else {
	var i = 1;
	repeat (columns - 2) {
		
		var j = 1;
		repeat (rows - 2) {
			// Middle center.
			draw_sprite_part_ext(sprite, 0, size, size, size, size, x1 + i * size * x_scale_tile, y1 + j * size * y_scale_tile, x_scale_tile, y_scale_tile, c_white, 1);
			
			j++;
		}
		
		i++;
	}
}