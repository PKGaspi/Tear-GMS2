/// @description Draw the dialogue bubble.

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

var x_offset = 14;
var y_offset = 0;

with (speaker) {
	var speaker_x = x;
	var speaker_y = y;
}

var mouth_x = speaker_mouth_x + speaker_x;
var mouth_y = speaker_mouth_y + speaker_y;

// TODO: x1 and y1 are fixed for every text. This can be optimized by
// calculating them once per text in the pre-draw event.
var x1 = mouth_x - total_width - x_margin - x_offset;
var y1 = mouth_y - total_height / 2 - y_margin - y_offset;
var x2 = x1 + width + 2 * x_margin;
var y2 = y1 + height + 2 * y_margin;

var x2_final = x1 + total_width + 2 * x_margin;
var y2_final = y1 + total_height + 2 * y_margin;
// Check if the dialogue is on camera and
// move it if necessary.
var camera = global.cameras[0];
with (camera) {
	var view_left	= x - self.width / 2;
	var view_right	= x + self.width / 2;
	var view_up		= y - self.height / 2;
	var view_down	= y + self.height / 2;
}

if (x1 < view_left) {
	// Symmetry to the x of the speaker.
	x1 = max(mouth_x + x_offset - x_margin, view_left);
	x2 = x1 + width + 2 * x_margin;
}
else if (x2_final > view_right) {
	// Symmetry to the x of the speaker.
	x2 = view_right - total_width + width - x_margin;
	x1 = x2 - width - 2 * x_margin;
	mouth_x = view_right;
}
if (y1 < view_up) {
	// Move to the top of the view.
	y1 = view_up;
	y2 = y1 + height + 2 * y_margin;
}
else if (y2_final > view_down) {
	// Move to the bottom of the view.
	y2 = view_down;
	y1 = y2 - height - 2 * y_margin;
}

// --- DRAWING ---

draw_roundrect_outline(x1, y1, x2, y2, border_color, inside_color, 1);
// Draw the spike.
var spike_height = 2;
if (y2 - y_margin - spike_height >= mouth_y) {
	// draw_sprite(spike_sprite, 0, x2 - 1, speaker_mouth_y + speaker_y);
	// draw_triangle_outline(mouth_x - 7, mouth_y, x2 - 1, mouth_y + 1, x2 - 1, mouth_y - 1, c_black, c_white, 1);
	draw_dialogue_spike(mouth_x + sign(x2 - mouth_x) * 7, mouth_y, mouth_x + min(abs(x1 - mouth_x), x2 - mouth_x), spike_height, border_color, inside_color, 1);
}
// Draw the actual box.
// draw_window(box_sprite, x1, y1, x2, y2, true);
//draw_roundrect_outline(x1, y1, x2, y2, c_black, c_white, 1);

// Draw the text.
// TODO: Calculate this color just once.
draw_set_color(color_for_contrast(inside_color));
draw_text_ext_size(x1 + x_margin, y1 + y_margin, text_draw, -1, total_width, font_size);
