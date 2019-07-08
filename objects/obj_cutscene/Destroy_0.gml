/// @description Exit the cutscene.

global.cutscene = false;

// Destroy if not properly created.
if (scene_info == -1) {
	show_debug_message("Cutscene " + string(id) + " not properly created at " + string(x) + " " + string(y) + ".");
}