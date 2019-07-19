/// @description Draw the dialogue box.
// Draw the actual box.
draw_window(box_sprite, x1, y1, x2, y2, false);

// Draw the text.
draw_set_font(speaker_font);
draw_set_color(c_black);
var _text = text[phrase];
var _text = _text[get_language_num(global.language)];
draw_text_ext_size(x1 + 1, y1 + 1, _text, -1, x2 - x1, 20);
