/// @description Draw the dialogue bubble.

draw_set_color(c_black);
draw_set_font(speaker_font);
// Variables.
var _text = text[phrase];
var _text = _text[get_language_num(global.language)];

var font_size = 5;
var font_og_size = font_get_size(draw_get_font());

// Text margins.
var x_margin = 4;
var y_margin = 2;

var width = 80;
var height = string_height_ext(_text, -1, width * font_og_size / font_size) * font_size / font_og_size;

var offset = - 10;
with (speaker) {
	var speaker_x = x;
	var speaker_y = y;
}
var x1 = speaker_mouth_x + speaker_x - width - x_margin + offset;
var y1 = speaker_mouth_y + speaker_y - height - y_margin + offset;
var x2 = speaker_mouth_x + speaker_x + offset + x_margin;
var y2 = speaker_mouth_y + speaker_y + offset + y_margin;

// Draw the actual box.
draw_window(box_sprite, x1, y1, x2, y2, true);

// Draw the text.
draw_text_ext_size(x1 + x_margin, y1 + y_margin, _text, -1, width, font_size);
// TODO: test with a fixed sized font.