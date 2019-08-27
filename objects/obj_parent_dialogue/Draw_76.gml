/// @description Dialogue control and management.

if (global.pause) exit;

// Check the size of the drawn text.
var _text = array_get(text[text_count], get_language_num(global.language));
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
		// Reset text and char_count.
		char_count = 1;
		_text = array_get(text[text_count], get_language_num(global.language));
	}
}

if (char_count < _text_length) {
	// TODO: Fix this for non int talk speeds.
	if (floor(char_count % 3) == 1) {
		// Play voice.
		audio_sound_pitch(speaker_voice, random_range(.99, 1.01));
		audio_play_sound(speaker_voice, 1, false);
	}
	// Increase the char count by the speaker talk speed.
	char_count += speaker_talk_speed;
	text_draw = string_copy(_text, 1, char_count);
}
else if (char_count > _text_length){
	// Avoid text errors if language was changed.
	char_count = _text_length;
	text_draw = _text;
}
