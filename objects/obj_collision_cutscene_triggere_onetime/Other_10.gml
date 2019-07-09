/// @description Generate cutscene.
// Inherit the parent event
event_inherited();

if (cutscene_id != -1) {
	var my_id = cutscene_id;
	with (obj_collision_cutscene_triggere_onetime) {
		if (cutscene_id == my_id) instance_destroy(self, false);
	}
}
