/// @desc updates the total widths and heights of a dialogue instance.

width = min(string_width_size(text_draw, font_size), max_width);
height = string_height_ext_size(text_draw, -1, max_width, font_size);

var lang = get_language_num(global.language);
var len = array_length_1d(text);
var i = 0;
repeat (len) {
	var __text = array_get(text[i], lang);
	total_widths[i] = min(string_width_size(__text, font_size), max_width);
	total_heights[i] = string_height_ext_size(__text, -1, max_width, font_size);
	i++;
}