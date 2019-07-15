/// @description Draw the window.
if (back_alpha != noone) {
	draw_window_background(inside_sprite, x1 + offset * dir_x, y1 + offset * dir_y, x2 + offset * dir_x, y2 + offset * dir_y, false, c_back, back_alpha);
}
else {
	draw_window(inside_sprite, x1 + offset * dir_x, y1 + offset * dir_y, x2 + offset * dir_x, y2 + offset * dir_y, false);
}
draw_border(border_sprite, x1, y1, x2, y2, border_stretch);