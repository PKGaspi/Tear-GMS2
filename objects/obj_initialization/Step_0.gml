/// @description Delete instance when audio groups are loaded.

if (audio_group_is_loaded(audiogroup_music) &&
	audio_group_is_loaded(audiogroup_soundeffects)) {
	instance_destroy();
}