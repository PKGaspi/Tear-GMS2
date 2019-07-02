/// @description Cutscene trigger condition.

//TODO: Add condition here.
if (!instance_exists(obj_cutscene)) {
	if (keyboard_check_pressed(vk_space)) {
		cutscene_create(scene_info);
		instance_destroy();
	}
}