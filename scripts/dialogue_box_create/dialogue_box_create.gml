/// @desc Creates a dialogue box with the given text.
/// @arg0 sprite Index of the sprite to draw.
/// @arg1 x1 The x position of the left border of the window.
/// @arg2 y1 The y position of the top border of the window.
/// @arg3 x2 The x position of the right border of the window.
/// @arg4 y2 The y position of the bottom border of the window.
/// @arg5 text Array of arrays of the texts in multiple languages.
/// @arg6 speaker

var _sprite = argument0;

var _x1 = argument1;
var _y1 = argument2;
var _x2 = argument3;
var _y2 = argument4;

var _text = argument5;

var _speaker = argument6;

if (_speaker != noone) with (_speaker) {
	var _speaker_x = mouth_x;
	var _speaker_y = mouth_y;
	var _speaker_name = name;
	var _speaker_voice = voice;
	var _speaker_voice_fast = voice_fast;
	var _speaker_font = font;
}

var inst = instance_create_layer(0, 0, "Hidden", obj_dialogue_box);
with (inst) {
	box_sprite = _sprite;
	
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
	
	text = _text;
	
	if (_speaker != noone) {
		speaker = _speaker;
		speaker_x = _speaker_x;
		speaker_y = _speaker_y;
		speaker_name = _speaker_name;
		speaker_voice = _speaker_voice;
		speaker_voice_fast = _speaker_voice_fast;
		speaker_font = _speaker_font;
	}
}
