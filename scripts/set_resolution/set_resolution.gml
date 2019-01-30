/// @desc Changes the resolution of the window to a given one. The caller needs to have window_center(); in alarm 0.
/// @arg0 Desired value.
global.resolution = argument0;
if (global.fullscreen) {
	window_set_size(global.resolutions[0, global.resolution], global.resolutions[1, global.resolution]);
}
else {
	window_resize(global.resolutions[0, global.resolution], global.resolutions[1, global.resolution]);
}