/// @description Draw the window.

// Draw main window.
draw_window_background(x1, y1, x2, y2, 1, c_border, c_inside, c_black, alpha_back);

// Draw text.
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_menu);
draw_text_ext_size((x1 + x2) / 2, y1 + 5, text, 1, (x2 - x1) / 2, 15);

// Draw options.
draw_set_valign(fa_middle);
var i = 0;
var ar_len = array_length_1d(options);
repeat (ar_len) {
	var c_temp;
	if (selected == i) {
		c_temp = c_selected;
	}
	else {
		c_temp = c_unselected;
	}
	var window_x = (x1 + x2) * (i + 1) / (ar_len + 1);
	var window_y = y2 - 20;
	var window_width = 40;
	var window_height = 20;
	var options_size = 15;
	draw_window(window_x - window_width / 2, window_y - window_height / 2, window_x + window_width / 2, window_y + window_height / 2, border_scale, c_border, c_temp);
	draw_text_ext_size((x1 + x2) * (i + 1) / (ar_len + 1), y2 - 20, options[i], 1, window_width / 2, options_size);
	i++;
}