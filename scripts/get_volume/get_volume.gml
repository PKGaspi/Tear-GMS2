/// @desc Returns the volume of the given channel taken in consideration if the audio is muted or not.
/// @arg0 channel Global variable of the channel. Can be master, sound or music.

if (global.audio_muted) {
	// Return 0 if the volume is muted.
	return 0;
}

return argument0;