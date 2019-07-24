/// @desc Creates a dialogue box with the given text.
/// @arg0 border_color
/// @arg1 inside_color
/// @arg2 x1 The x position of the left border of the window.
/// @arg3 y1 The y position of the top border of the window.
/// @arg4 x2 The x position of the right border of the window.
/// @arg5 y2 The y position of the bottom border of the window.
/// @arg6 text Array of arrays of the texts in multiple languages.
/// @arg7 speaker

var _border_color = argument0;
var _inside_color = argument1;

var _x1 = argument2;
var _y1 = argument3;
var _x2 = argument4;
var _y2 = argument5;

var _text = argument6;

var _speaker = argument7;

if (_speaker != noone) with (_speaker) {
	var _speaker_name = name;
	var _speaker_voice = voice;
	var _speaker_voice_fast = voice_fast;
	var _speaker_font = font;
}

var inst = instance_create_layer(0, 0, "Text", obj_dialogue_box);
with (inst) {
	border_color = _border_color;
	inside_color = _inside_color;
	
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
	
	text = _text;
	
	if (_speaker != noone) {
		speaker = _speaker;
		speaker_name = _speaker_name;
		speaker_voice = _speaker_voice;
		speaker_voice_fast = _speaker_voice_fast;
		speaker_font = _speaker_font;
	}
}

return inst;
