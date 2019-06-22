/// @desc Changes antialising to a given value.
/// @arg Desired value.
if (instance_exists(obj_camera) && object_index != obj_camera) {
	// Hay que aplicar la opción en el siguiente frame.
	obj_camera.alarm[0] = 1;	
}
else if (object_index == obj_camera) {
	global.antialiasing = argument0;
	display_reset(ANTIALIASING_VALUES[global.antialiasing], global.vsync);
}