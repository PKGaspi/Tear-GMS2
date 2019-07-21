/// @description Draw the dialogue bubble.

draw_set_color(c_black);
draw_set_font(speaker_font);
// Variables.
var font_size = 5;
var font_og_size = font_get_size(draw_get_font());

// Text margins.
var x_margin = 4;
var y_margin = 2;

var _text = array_get(text[text_count], get_language_num(global.language));

var total_width = min(string_width(_text) * font_size / font_og_size, 80);
var total_height = string_height_ext(_text, -1, total_width * font_og_size / font_size) * font_size / font_og_size;

var width = min(string_width(text_draw) * font_size / font_og_size, 80);
var height = string_height_ext(text_draw, -1, total_width * font_og_size / font_size) * font_size / font_og_size;

var offset = - 12;
with (speaker) {
	var speaker_x = x;
	var speaker_y = y;
}
var x1 = speaker_mouth_x + speaker_x - total_width - x_margin + offset;
var y1 = speaker_mouth_y + speaker_y - total_height - y_margin + offset;
var x2 = x1 + width + 2 * x_margin;
var y2 = y1 + height + 2 * y_margin;

var x2_final = x1 + total_width + 2 * x_margin;
var y2_final = y1 + total_height + 2 * y_margin;
// Check if the dialogue is on camera and
// move it if necessary.
var camera = global.cameras[0];
with (camera) {
	var c_x = x;
	var c_y = y;
	var c_w = self.width;
	var c_h = self.height;
}

if (x1 < c_x - c_w / 2) {
	// Symmetry to the x of the speaker.
	x1 = max(speaker_mouth_x + speaker_x - offset, c_x - c_w / 2);
	x2 = x1 + width + 2 * x_margin;
}
else if (x2_final > c_x + c_w / 2) {
	// Symmetry to the x of the speaker.
	x2 = c_x + c_w / 2 - total_width + width;
	x1 = x2 - width - 2 * x_margin;
}
if (y1 < c_y - c_h / 2) {
	// Move to the top of the view.
	y1 = c_y - c_h / 2;
	y2 = y1 + height + 2 * y_margin;
}
else if (y2_final > c_y + c_h / 2) {
	// Move to the bottom of the view.
	y2 = c_y + c_h / 2;
	y1 = y2 - height - 2 * y_margin;
}

// Draw the actual box.
draw_window(box_sprite, x1, y1, x2, y2, true);

// Draw the text.
draw_text_ext_size(x1 + x_margin, y1 + y_margin, text_draw, -1, total_width, font_size);
