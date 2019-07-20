/// @description Dialogue control and management.

if (global.pause) exit;

// Check the size of the drawn text.
var _text = text[text_count];
var _text = _text[get_language_num(global.language)];
var _text_length = string_length(_text);

// Input variables.
var input_next_p = keyboard_check_pressed(global.key_accept) || keyboard_check_pressed(global.key_down);
var input_previous_p = keyboard_check_pressed(global.key_up);

var v_move_p = input_next_p - input_previous_p;
if (v_move_p != 0) {
	if (char_count < _text_length) {
		// Fast show all the current text.
		char_count = _text_length;
		text_draw = _text;
		audio_stop_sound(speaker_voice);
		audio_play_sound(speaker_voice_fast, 1, false);
	}
	else {
		// Go to previous or next text_count.
		var arr_height = array_length_1d(text);
		text_count = clamp(text_count + v_move_p, 0, arr_height);
	
		if (text_count >= arr_height) {
			instance_destroy(self, false);
			exit;
		}
		// Empty drawing text.
		text_draw = "";
		char_count = 0;
	}
}

if (char_count < _text_length) {
	// Increment text size by one char.
	char_count++;
	text_draw = string_copy(_text, 1, char_count);
	if (char_count % 3 == 1) {
		// Play voice.
		audio_play_sound(speaker_voice, 1, false);
	}
}
else if (char_count > _text_length){
	// Avoid text errors if language was changed.
	char_count = _text_length;
	text_draw = _text;
}
