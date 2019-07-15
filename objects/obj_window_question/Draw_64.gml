/// @description Draw the window.

// Save old drawing parameters.
var d_par = save_drawing_parameters();

// Draw main window shadow.
draw_window(spr_window_menu_border, x1 + global.draw_ratio, y1 + global.draw_ratio, x2 + global.draw_ratio, y2 + global.draw_ratio, true);
// Draw main window.
draw_window_background(spr_window_menu_border, x1, y1, x2, y2, 1, c_black, alpha_back);

// Draw main text.
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(color_for_contrast(c_inside));
draw_set_font(fnt_menu);
draw_text_ext_size((x1 + x2) / 2, y1 + 5, text, 1, (x2 - x1) / 2, 15);

// Draw options.
draw_set_valign(fa_middle);
var i = 0;
var ar_len = array_length_1d(options);
repeat (ar_len) {
	// Variables for colors.
	var c_box_inside;
	var c_box_border;
	var c_box_text;
	
	// Variables for positions and sizes.
	var window_x = (x1 + x2) * (i + 1) / (ar_len + 1);
	var window_y = y2 - 20;
	var window_width = (x2 - x1) / (ar_len + 1);
	var window_height = (y2 - y1) / 5;
	var options_size = 15;
	
	// Aply select_bump to make selected option bigger.
	window_width += select_bump[i];
	window_height += select_bump[i];
	options_size += select_bump[i];
	
	// Select colors for selected or unselected option.
	if (selected == i) {
		// If the window is selected.
		c_box_border = c_white;
		c_box_inside = c_selected;
		c_box_text = color_for_contrast(c_box_inside);
	}
	else {
		// If the window is not selected.
		c_box_border = c_ltgray;
		c_box_inside = make_color_hsv(color_get_hue(c_selected), 0, color_get_value(c_selected));
		c_box_text = color_for_contrast(c_box_inside);
	}
	
	// Draw window shadow.
	// draw_window(spr_window_menu_border, window_x - window_width / 2 + global.draw_ratio, window_y - window_height / 2 + global.draw_ratio, window_x + window_width / 2 + global.draw_ratio, window_y + window_height / 2 + global.draw_ratio);
	// Draw window.
	draw_window(spr_window_menu_border, window_x - window_width / 2, window_y - window_height / 2, window_x + window_width / 2, window_y + window_height / 2, true);
	// Draw option text.
	draw_set_color(c_box_text);
	draw_text_ext_size((x1 + x2) * (i + 1) / (ar_len + 1), y2 - 20, options[i], 1, window_width / 2, options_size);
	i++;
}

// Restore old drawing parameters.
restore_drawing_parameters(d_par);