/// @description Draw the menu.
if (!global.pause) exit;

var lang						= get_language_num(global.language);

var ds_grid						= menu_pages[page];
var ds_height					= ds_grid_height(ds_grid);

var gwidth						= global.view_width;
var gheight						= global.view_height;

var y_buffer					= gheight / 16.875;
var y_start						= (gheight / 2) - (((ds_height) / 2) * y_buffer);
var y_buffer_title				= gheight / 15;
var x_buffer_left				= gwidth / 3.2;
var x_buffer_right				= gwidth / 50;
var x_sprite_buffer				= gwidth / 60;
var x_start						= gwidth / 2;

var toggle_sprite				= spr_check;
var toggle_width				= sprite_get_width(toggle_sprite)
var toggle_scale				= 1.8 * x_sprite_buffer / toggle_width;
var toggle_buffer				= x_sprite_buffer;

var slider_length				= x_buffer_left * 2 / 3;
var slider_radious				= x_sprite_buffer / 4;

draw_set_font(fnt_menu);

var font_size					= font_get_size(fnt_menu);
var text_scale_normal			= 22;
var text_scale_selected			= 28;
var text_scale_title			= 50;

var select_scale				= text_scale_selected / text_scale_normal;
var select_offset				= x_sprite_buffer / 2;

var x_window					= x_sprite_buffer;
var y_window					= x_sprite_buffer;
var border_size					= slider_radious;

var c_selected					= c_white;
var c_unselected				= c_ltgray;
var c_accent					= c_white;
var c_back						= c_black;
var c_inside					= global.c_purple_0;

// ---------- Background ----------
draw_window_background(x_window, y_window, gwidth - x_window, gheight - y_window, 1, c_accent, c_inside, c_back, .8);

// ---------- Title ----------
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_halign(fa_middle);
draw_set_color(c_selected);
var text = ds_grid[# 4, ds_height - 1];
draw_text_size(x_start, y_buffer_title, text[lang], text_scale_title);

// ---------- Left side ----------
draw_set_color(c_unselected);
draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var x_left = x_start - x_buffer_left;
var y_left;

var yy = 0;
repeat (ds_height) {
	
	var x_offset = 0;
	y_left	= y_start + (yy * y_buffer);
	
	text = ds_grid[# 0, yy];
	var sprite = ds_grid[# 1, yy];
	var sprite_scale = 1.8 * x_sprite_buffer / sprite_get_width(sprite);
	
	var selected = yy == menu_option[page];
	if (selected) {
		x_offset = - select_offset;
		draw_set_color(c_selected);
		if ( sprite != noone) {
			draw_sprite_ext(sprite, 0, x_left - x_sprite_buffer * 1.5 + x_offset, y_left, sprite_scale * select_scale, sprite_scale * select_scale, 0, -1, 1);
		}
		draw_text_size(x_left + x_offset, y_left, text[lang], text_scale_selected);
		draw_set_color(c_unselected);
	}
	else {
		if ( sprite != noone) {
			draw_sprite_ext(sprite, 0, x_left - x_sprite_buffer * 1.5 + x_offset, y_left, sprite_scale, sprite_scale, 0, c_unselected, 1);
		}
		draw_text_size(x_left + x_offset, y_left, text[lang], text_scale_normal);
	}
	yy++;
}

// ---------- Line ----------
draw_set_color(c_accent);
draw_set_alpha(1);
draw_line(x_start, y_start - y_buffer, x_start, y_left + y_buffer);

// ---------- Right side ----------
draw_set_color(c_unselected);
draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);


var x_right = x_start + x_buffer_right;
var y_right;

var yy = 0;
repeat (ds_height) {
	y_right = y_start + (yy * y_buffer);
	
	var current_val = ds_grid[# 4, yy];	
	var selected = yy == menu_option[page];
	
	switch (ds_grid[# 2, yy]) {
		case menu_element_type.shift: { // Shfit.
			var current_array = ds_grid[# 5, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			
			if (current_val == 0) left_shift = "";
			if (current_val == array_length_1d(current_array) - 1) right_shift = "";

			if (selected) {
				draw_set_color(c_selected);
				draw_text_size(x_right, y_right, left_shift + current_array[current_val] + right_shift, text_scale_selected);
				draw_set_color(c_unselected);
			}
			else {
				draw_text_size(x_right, y_right, left_shift + current_array[current_val] + right_shift, text_scale_normal);
			}
			break;
		}
		
		case menu_element_type.slider: { // Slider.
			var len = slider_length;
			var current_array = ds_grid[# 5, yy];
			var circle_pos = (current_val - current_array[0]) / (current_array[1] - current_array[0]);
			
			if (selected) {
				draw_set_color(c_selected);
				len = floor(len * select_scale);
				draw_line(x_right, y_right, x_right + len, y_right);
				draw_circle(x_right + (circle_pos * len), y_right, slider_radious, false);
				draw_text_size(x_right + len + x_buffer_right, y_right, string(floor(circle_pos * 100)) + "%", text_scale_selected);
				draw_set_color(c_unselected);
			}
			else {
				draw_line(x_right, y_right, x_right + len, y_right);
				draw_circle(x_right + (circle_pos * len), y_right, slider_radious, false);
				draw_text_size(x_right + len + x_buffer_right, y_right, string(floor(circle_pos * 100)) + "%", text_scale_normal);
			}
			break;
		}
		
		case menu_element_type.toggle: { // Toggle.
			var scale = toggle_scale;
			if (selected) {
				draw_set_color(c_selected);
				scale *= select_scale;
				draw_sprite_ext(toggle_sprite, current_val, x_right + toggle_buffer, y_right, scale, scale, 0, c_selected, 1);
				draw_text_size(x_right + 3 * (toggle_buffer), y_right, boolean_to_yesno(current_val), text_scale_selected);
				draw_set_color(c_unselected);
			}
			else {
				draw_sprite_ext(toggle_sprite, current_val, x_right + toggle_buffer, y_right, scale, scale, 0, c_unselected, 1);
				draw_text_size(x_right + 3 * (toggle_buffer), y_right, boolean_to_yesno(current_val), text_scale_normal);
			}
			break;
		}
		
		case menu_element_type.input: { // Input.
			var string_val;
			
			switch (current_val) {
				case vk_up:			string_val = "Up key"; break;
				case vk_down:		string_val = "Down key"; break;
				case vk_left:		string_val = "Left key"; break;
				case vk_right:		string_val = "Right key"; break;
				default:			string_val = chr(current_val); break;
			}
			
			if (selected) {
				draw_set_color(c_selected);
				draw_text(x_right, y_right, string_val);
				draw_set_color(c_unselected);
			}
			draw_text_size(x_right, y_right, string_val, text_scale_normal);
		}
	}
	yy++;
}