/// @description Cutscene trigger condition.

//TODO: Add condition here.
if (!instance_exists(obj_cutscene)) {
	if (true) {
		cutscene_create(scene_info);
		instance_destroy();
	}
}