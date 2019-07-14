/// @desc Changes volume to the ones in the global variables.

audio_master_gain(get_volume(global.master_volume));
audio_group_set_gain(audiogroup_music, get_volume(global.music_volume), 0);
audio_group_set_gain(audiogroup_soundeffects, get_volume(global.sound_volume), 0);
