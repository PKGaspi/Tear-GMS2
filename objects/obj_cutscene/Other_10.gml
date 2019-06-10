/// @description Setup script and arguments for execution.

current_scene = scene_info[scene];

var len = array_length_1d(current_scene) - 1;

current_scene_arguments = -1;
current_scene_arguments = array_create(len, 0);
array_copy(current_scene_arguments, 0, current_scene, 1, len);