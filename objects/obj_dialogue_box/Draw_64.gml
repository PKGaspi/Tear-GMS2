/// @description Draw the dialogue box.
if (global.pause) exit;

// Draw the actual box.
draw_window(box_sprite, x1, y1, x2, y2, false);

var font_size = 7;

// Draw the text.
draw_set_font(speaker_font);
draw_set_color(c_black);

var _text = text_draw;

draw_text_ext_size(x1 + 1, y1 + 1, _text, -1, x2 - x1, font_size);
