/// @description Delete instance when audio groups are loaded.

if (audio_group_is_loaded(audiogroup_music) &&
	audio_group_is_loaded(audiogroup_soundeffects)) {
	if (debug_mode) {
		instance_create_layer(0, 0, "Hidden", obj_debug);
		room_goto(rm_test);
	}
	instance_destroy();
}