/// @desc Creates a window of the given size with the given options.
/// @arg0 x1
/// @arg1 y1
/// @arg2 x2
/// @arg3 y2
/// @arg4 text Text to draw.
/// @arg5 options[] Array of options.
/// @arg6 actions[] Array of scripts.
/// @arg7 default_option
/// @arg8 border_scale The scale of the border.
/// @arg9 color_border The color of the border.
/// @arg color_inside The color of the inside.
/// @arg color_selected The color of the selected option.
/// @arg color_unselected The color of the unselected options.
/// @arg alpha_back Alpha of the black background.


var _x1 = argument0;
var _y1 = argument1;
var _x2 = argument2;
var _y2 = argument3;

var _text = argument4;
var _options = argument5;
var _actions = argument6;
var _default_option = clamp(argument7, 0, array_length_1d(_options));

var _border_scale = argument8;

var _c_border = argument9;
var _c_inside = argument10;
var _c_selected = argument11;
var _c_unselected = argument12;
var _alpha_back = argument13;

with (instance_create_layer(0, 0, "Hidden", obj_window_question)) {
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
	
	text = _text;
	options = _options;
	actions = _actions;
	selected = _default_option;
	
	border_scale = _border_scale
	c_border = _c_border;
	c_inside = _c_inside;
	c_selected = _c_selected;
	c_unselected = _c_unselected;
	alpha_back = _alpha_back;
	
	active = true;
	
	alarm[0] = 0; // Do not destroy.
}