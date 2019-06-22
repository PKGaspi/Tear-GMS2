/// @desc Resizes game window to a given width and height and positions it in the middle of the screen.
/// @arg0 width
/// @arg1 height
window_set_rectangle((global.DISPLAY_HEIGHT / 2) - (argument0 / 2), (global.DISPLAY_HEIGHT / 2) - (argument1 / 2), argument0, argument1);