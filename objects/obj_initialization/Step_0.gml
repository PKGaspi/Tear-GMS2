/// @description Delete instance when audio groups are loaded.

if (audio_group_is_loaded(audiogroup_music) &&
	audio_group_is_loaded(audiogroup_soundeffects)) {
	
	// Destroy if everything else is initialized.
	if (destroy >= 3) {
		instance_destroy();
	}
	else {
		destroy++;
	}
}