/// @description 

var input_next_p = keyboard_check_pressed(global.key_accept) || keyboard_check_pressed(global.key_down);
var input_previous_p = keyboard_check_pressed(global.key_up);

var v_move_p = input_next_p - input_previous_p;
if (v_move_p != 0) {
	// Go to previous or next phrase.
	var arr_height = array_length_1d(text);
	phrase = clamp(phrase + v_move_p, 0, arr_height);
	
	if (phrase >= arr_height) {
		instance_destroy(self, false);
	}
}