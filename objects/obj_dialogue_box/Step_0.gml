/// @description 

if (global.pause) exit;

var input_next_p = keyboard_check_pressed(global.key_accept) || keyboard_check_pressed(global.key_down);
var input_previous_p = keyboard_check_pressed(global.key_up);

var v_move_p = input_next_p - input_previous_p;
if (v_move_p != 0) {
	// Empty drawing text.
	text_draw = "";
	char_count = 0;
	// Go to previous or next text_count.
	var arr_height = array_length_1d(text);
	text_count = clamp(text_count + v_move_p, 0, arr_height);
	
	if (text_count >= arr_height) {
		instance_destroy(self, false);
		exit;
	}
}

// Check the size of the drawn text.
var _text = text[text_count];
var _text = _text[get_language_num(global.language)];
var _text_lenght = string_length(_text)
if (char_count < string_length(_text)) {
	// Increment text size by one char.
	char_count++;
	text_draw += string_char_at(_text, char_count);
	if (char_count % 3 == 1) {
		// Play voice.
		audio_play_sound(speaker_voice, 1, false);
	}
}
else if (char_count > _text_lenght){
	// Avoid text errors if language was changed.
	char_count = _text_lenght;
	text_draw = text;
}
