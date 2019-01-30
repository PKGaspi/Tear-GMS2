/// @desc Toggles audio on/off.

global.audio_muted = !global.audio_muted;
if (global.audio_muted) {
	audio_master_gain(0);
}
else {
	audio_master_gain(global.master_volume);	
}