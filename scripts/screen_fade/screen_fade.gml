/// @desc Makes the screen fade in or out depending on the number of arguments.
/// @arg0 seconds The number of seconds it takes for the fade to finish.
/// @arg1 color* The color to fade in. No argument = fade out.

if (argument_count == 1) {
	// Fade out with only one argument.
	with (obj_screen_fade) {
		frames = argument[0] * room_speed;
		fade = -1; // Fade out.
	}
}
else {
	with (instance_create_layer(0, 0, "Hidden", obj_screen_fade)) {
		frames = argument[0] * room_speed;
		color = argument[1];
		fade = 1; // Fade out.
		alarm[0] = 0;
	}
}