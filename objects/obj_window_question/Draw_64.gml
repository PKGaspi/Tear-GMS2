/// @description Draw the window.

// Draw main window.
draw_window_background(x1, y1, x2, y2, 1, c_border, c_inside, c_black, alpha_back);

// Draw text.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(fnt_menu);
draw_text_size((x1 + x2) / 2, y1 + 20, text, 30);

// Draw options.
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
	draw_window((x1 + x2) * (i + 1) / (ar_len + 1) - 20, y2 - 30, (x1 + x2) * (i + 1) / (ar_len + 1) + 20, y2 - 10, border_scale, c_border, c_temp);
	draw_text_size((x1 + x2) * (i + 1) / (ar_len + 1), y2 - 20, options[i], 22);
	i++;
}