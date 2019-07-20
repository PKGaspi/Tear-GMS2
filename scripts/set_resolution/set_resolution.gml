/// @desc Changes the resolution of the window to a given one. The caller needs to have window_center(); in alarm 0.
/// @arg0 Desired value.
global.resolution = argument0;
var res = global.RESOLUTIONS[global.resolution];
if (!global.fullscreen) {
	window_resize(res[0], res[1]);
}
