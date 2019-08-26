/// @desc Makes the camera move randomly simulating a screenshake.
/// @arg0 camera The camera id to shake.
/// @arg1 duration The duration of the shake in seconds.
/// @arg2 magnitude The magnitude of the shake in pixels.
/// @return exit_status Succes 0, failure -1.

if (argument0 < array_length_1d(global.cameras)) {
	with (global.cameras[argument0]) {
		shake_length = argument1 * room_speed;
		shake_level = argument2;
		shake_remain = shake_level;
	}
	return 0;
}
return -1;