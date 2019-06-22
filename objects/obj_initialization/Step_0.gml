/// @description Load test music.

if (audio_group_is_loaded(audiogroup_music) && !audio_is_playing(msc_test)) {
	audio_play_sound(msc_test, 10, true);	
}