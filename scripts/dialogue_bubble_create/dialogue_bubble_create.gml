/// @desc Creates a dialogue bubble with the given text.
/// @arg0 border_color
/// @arg1 inside_color
/// @arg2 text Array of arrays of the texts in multiple languages.
/// @arg3 speaker

var _border_color = argument0;
var _inside_color = argument1;

var _text = argument2;

var _speaker = argument3;

if (_speaker != noone) with (_speaker) {
	var _speaker_x = mouth_x;
	var _speaker_y = mouth_y;
	var _speaker_name = name;
	var _speaker_voice = voice;
	var _speaker_voice_fast = voice_fast;
	var _speaker_talk_speed = talk_speed;
	var _speaker_font = font;
}

var inst = instance_create_layer(0, 0, "Text", obj_dialogue_bubble);
with (inst) {
	border_color = _border_color;
	inside_color = _inside_color
	
	text = _text;
	if (_speaker != noone) {
		speaker = _speaker;
		speaker_mouth_x = _speaker_x;
		speaker_mouth_y = _speaker_y;
		speaker_name = _speaker_name;
		speaker_voice = _speaker_voice;
		speaker_voice_fast = _speaker_voice_fast;
		speaker_talk_speed = _speaker_talk_speed;
		speaker_font = _speaker_font;
	}
	
	dialogue_update_sizes();
}

return inst;
