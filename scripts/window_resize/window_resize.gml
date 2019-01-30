/// @desc Resizes game window to a given width and height and positions it in the middle of the screen.
/// @arg0 width
/// @arg1 height
window_set_rectangle((global.display_width /2) - (argument0 / 2), (global.display_height /2) - (argument1 / 2), argument0, argument1);