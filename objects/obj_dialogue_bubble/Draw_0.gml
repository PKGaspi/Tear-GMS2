/// @description Draw the dialogue bubble.

draw_set_color(c_black);
draw_set_font(speaker_font);
// Variables.
var _text = text[phrase];
var _text = _text[get_language_num(global.language)];

var font_size = 15;

var width = 40;
var height = string_height_ext(_text, 10, width);


var offset = - 10;
with (speaker) {
	var speaker_x = x;
	var speaker_y = y;
}
var x1 = speaker_mouth_x + speaker_x - width + offset;
var y1 = speaker_mouth_y + speaker_y - height + offset;
var x2 = speaker_mouth_x + speaker_x + offset;
var y2 = speaker_mouth_y + speaker_y + offset;

// Draw the actual box.
draw_window(box_sprite, x1, y1, x2, y2, false);

// Draw the text.

draw_text_ext_size(x1 + 1, y1 + 1, _text, -1, width, font_size);