/// @description Draw the dialogue box.

if (global.pause) exit;

// Draw the actual box.
draw_roundrect_outline(x1, y1, x2, y2, border_color, inside_color, 1);

var font_size = 7;

// Draw the text.
draw_set_font(speaker_font);
// TODO: Calculate this color just once.
draw_set_color(color_for_contrast(inside_color));

var _text = text_draw;

draw_text_ext_size(x1 + 1, y1 + 1, _text, -1, x2 - x1, font_size);
