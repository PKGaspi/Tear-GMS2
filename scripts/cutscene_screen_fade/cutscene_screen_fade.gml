/// @desc Makes the screen fade in or out depending on the number of arguments. It also increments the scene of the current cutscene.
/// @arg0 seconds The number of seconds it takes for the fade to finish.
/// @arg1 [color] The color to fade in. No argument = fade out.
// Note.- This script does NOT wait for the fade to finish for it to increment the scene state.

if (argument_count == 1) {
	screen_fade(argument[0]);
}
else {
	screen_fade(argument[0], argument[1]);	
}

cutscene_scene_next();