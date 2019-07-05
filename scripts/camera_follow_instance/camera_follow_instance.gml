/// @desc Make the camera follow a given instance.
/// @arg0 camera The camera index to follow the player.
/// @arg1 inst_id The id of the instance to follow.
/// @return exit_status Succes 0, failure -1.

if (argument0 < array_length_1d(global.cameras)) {
	global.cameras[argument0].follow = argument1;
	return 0;
}
return -1;