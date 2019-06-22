/// @desc Changes the resolution of the window to a given one. The caller needs to have window_center(); in alarm 0.
/// @arg0 Desired value.
global.resolution = argument0;
if (global.fullscreen) {
	window_set_size(global.RESOLUTIONS[0, global.resolution], global.RESOLUTIONS[1, global.resolution]);
}
else {
	window_resize(global.RESOLUTIONS[0, global.resolution], global.RESOLUTIONS[1, global.resolution]);
}