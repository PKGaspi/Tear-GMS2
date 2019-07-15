/// @desc Creates a window with an animated inside part.
/// @arg0 inside_sprite
/// @arg1 border_sprite
/// @arg2 x1
/// @arg3 y1
/// @arg4 x2
/// @arg5 y2
/// @arg6 border_stretch
/// @arg7 spd The speed of the animation.
/// @arg8 dir The direction of the animation.
/// @arg9 background_color A color to draw in the background. Can leave to noone.
/// @arg0 background_alpha The transparency of the background.

var inst = instance_create_layer(0, 0, "Hidden", obj_window_animated);
with (inst) {
	inside_sprite = argument0;
	border_sprite = argument1;
	
	x1 = argument2;
	y1 = argument3;
	x2 = argument4;
	y2 = argument5;

	border_stretch = argument6;
	spd = argument7;
	dir = argument8;
	
	c_back = argument9;
	back_alpha = argument10;
}

return inst;