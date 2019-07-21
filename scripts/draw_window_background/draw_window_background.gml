/// @desc Draws a window in the given position with the given window sprite and background color.
/// @arg0 sprite Index of the sprite to draw.
/// @arg1 x1 The x position of the left border of the window.
/// @arg2 y1 The y position of the top border of the window.
/// @arg3 x2 The x position of the right border of the window.
/// @arg4 y2 The y position of the bottom border of the window.
/// @arg5 scale Whether to scale the sprites (true) or to draw them multiple times.
/// @arg6 background_color The color of the background.
/// @arg7 back_alpha The alpha of the background.


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

var c_back = argument6;
var back_alpha = argument7;

// Background.
draw_set_alpha(back_alpha);
draw_set_color(c_back);
draw_rectangle_color(0, 0, global.view_width, global.view_height, c_back, c_back, c_back, c_back, false);

// Window.
draw_window(sprite, x1, y1, x2, y2, scale);