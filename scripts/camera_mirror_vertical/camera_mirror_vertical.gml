/// @desc Make the camera mirror in the vertical axes.
/// @arg0 camera The camera index to mirror.
/// @return exit_status Succes 0, failure -1.

if (argument0 < array_length_1d(global.cameras)) {
	with (global.cameras[argument0]) {
		zoom_sp = 0;
		height_to *= -1;
	}
	return 0;
}
return -1;