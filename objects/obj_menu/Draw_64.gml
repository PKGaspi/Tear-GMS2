/// @description Draw the menu.
if (!global.pause) exit;

var lang						= get_language_num(global.language);

var ds_grid						= menu_pages[page];
var ds_height					= ds_grid_height(ds_grid);

var gwidth						= global.view_width;
var gheight						= global.view_height;

var y_buffer					= gheight / 16.875;
var y_start						= (gheight / 2) - (((ds_height) / 2) * y_buffer);
var y_buffer_title				= gheight / 11;
var y_line_offset				= -1;
var x_buffer_left				= gwidth / 3.2;
var x_buffer_right				= gwidth / 50;
var x_sprite_buffer				= gwidth / 60;
var x_start						= gwidth / 2;

var toggle_sprite				= spr_check;
var toggle_width				= sprite_get_width(toggle_sprite)
var toggle_scale				= 1.8 * x_sprite_buffer / toggle_width;
var toggle_buffer				= x_sprite_buffer;

var line_width					= .2;
var slider_length				= x_buffer_left * 2 / 3;
var slider_radious				= x_sprite_buffer / 4;

draw_set_font(fnt_menu);
var text_scale_normal			= 22;
var text_scale_selected			= 26;
var text_scale_title			= 50;
var text_border					= 1;

var select_scale				= text_scale_selected / text_scale_normal;
var select_offset				= x_sprite_buffer / 2;

var c_selected					= color_change_endianness($fdd835);
var c_selected_border			= global.c_deep_purple_0;
var c_unselected				= c_white;

// ---------- Title ----------
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_halign(fa_middle);
var text = ds_grid[# 4, ds_height - 1];
draw_text_outline_size(x_start, y_buffer_title, text[lang], c_selected_border, c_selected, text_border * 2, text_scale_title);

// var text_width = string_width(text[lang]);
// draw_line_width_outline(x_start - text_width / 15, y_buffer_title * 2.3, x_start + text_width / 16, y_buffer_title * 2.3, .4, c_selected_border, c_selected, text_border);

// ---------- Left side ----------
draw_set_color(c_unselected);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var x_left = x_start - x_buffer_left;
var y_left;

var yy = 0;
repeat (ds_height) {
	
	var x_offset = 0;
	y_left = y_start + (yy * y_buffer);
	
	if ((mouse_active) && 
		(y_left - y_buffer / 2 < mouse_y && mouse_y < y_left + y_buffer / 2) &&
		(x_left + x_offset - x_sprite_buffer * 3 < mouse_x && mouse_x < gwidth - (x_left + x_offset - x_sprite_buffer * 3))) {
		// If the mouse is in the position of this line.
		if (menu_option[page] != yy) {
			audio_play_sound(snd_menu_move, 1, false);
			menu_option[page] = yy;
		}
		
	}
	
	text = ds_grid[# 0, yy];
	var sprite = ds_grid[# 1, yy];
	var sprite_scale = 1.8 * x_sprite_buffer / sprite_get_width(sprite);
	
	var selected = yy == menu_option[page];
	if (selected) {
		x_offset = - select_offset;
		if (sprite != noone) {
			draw_sprite_ext_outline(sprite, 0, x_left - x_sprite_buffer * 1.5 + x_offset, y_left, sprite_scale * select_scale, sprite_scale * select_scale, 0, 1, c_selected_border, c_selected, text_border);
		}
		draw_text_outline_size(x_left + x_offset, y_left, text[lang], c_selected_border, c_selected, text_border, text_scale_selected);
	}
	else {
		if (sprite != noone) {
			draw_sprite_ext(sprite, 0, x_left - x_sprite_buffer * 1.5 + x_offset, y_left, sprite_scale, sprite_scale, 0, c_unselected, 1);
		}
		draw_text_size(x_left + x_offset, y_left, text[lang], text_scale_normal);
	}
	yy++;
}

// ---------- Line ----------
draw_line_width_outline(x_start, y_start - y_buffer, x_start, y_left + y_buffer, line_width, c_selected_border, c_selected, text_border);

// ---------- Right side ----------
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
				draw_text_outline_size(x_right, y_right, left_shift + current_array[current_val] + right_shift, c_selected_border, c_selected, text_border, text_scale_selected);
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
				len = floor(len * select_scale);
				draw_line_width_outline(x_right, y_right + y_line_offset, x_right + len, y_right + y_line_offset, line_width, c_selected_border, c_selected, text_border);
				draw_circle_outline(x_right + (circle_pos * len), y_right + y_line_offset, slider_radious, c_selected_border, c_selected, .2);
				draw_text_outline_size(x_right + len + x_buffer_right, y_right, string(floor(circle_pos * 100)) + "%", c_selected_border, c_selected, text_border, text_scale_selected);

				// Draw advise.
				draw_set_valign(fa_middle);
				draw_set_halign(fa_center);
				
				var text = ["You can adjust the value faster by pressing the run button while doing so.", "Puedes ajustar el valor más rápido si pulsas el botón de correr mientras lo haces."]
				draw_text_outline_size(x_start,  y_left + y_buffer + text_scale_normal / 2, text[lang], c_selected_border, c_selected, text_border, text_scale_normal / 2);
				
				draw_set_valign(fa_middle);
				draw_set_halign(fa_left);
				
				// Update value if the user is using a mouse. It is easier to do here.
				if (mouse_check_button(mb_left) &&
					x_right - slider_radious < ms_x) {
					ds_grid[# 4, yy] = clamp((ms_x - x_right - slider_radious) / len, 0, 1);
				}

			}
			else {
				draw_line_width(x_right, y_right + y_line_offset, x_right + len, y_right + y_line_offset, line_width);
				draw_circle(x_right + (circle_pos * len), y_right + y_line_offset, slider_radious, false);
				draw_text_size(x_right + len + x_buffer_right, y_right, string(floor(circle_pos * 100)) + "%", text_scale_normal);
			}
			break;
		}
		
		case menu_element_type.toggle: { // Toggle.
			var scale = toggle_scale;
			if (selected) {
				draw_set_color(c_selected_border);
				scale *= select_scale;
				draw_sprite_ext_outline(toggle_sprite, current_val, x_right + toggle_buffer, y_right, scale, scale, 0, 1, c_selected_border, c_selected, text_border);
				draw_text_outline_size(x_right + 3 * (toggle_buffer), y_right, boolean_to_yesno(current_val), c_selected_border, c_selected, text_border, text_scale_selected);
				draw_set_color(c_unselected);
			}
			else {
				draw_sprite_ext(toggle_sprite, current_val, x_right + toggle_buffer, y_right, scale, scale, 0, c_unselected, 1);
				draw_text_size(x_right + 3 * (toggle_buffer), y_right, boolean_to_yesno(current_val), text_scale_normal);
			}
			break;
		}
		
		case menu_element_type.input: { // Input.
			// TODO: this section.
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