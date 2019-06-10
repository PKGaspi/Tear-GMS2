/// @desc Creates a cutscene with the given scenes.
/// @arg0 scene_info

var cutscene = instance_create_layer(0, 0, "Hidden", obj_cutscene);
with (cutscene) {
	scene_info = argument0;
	event_perform(ev_other, ev_user0);
}