/// @description
// Draw red curtain if hacked.

if (global.hacked) {
	draw_set_alpha(.2);
	draw_rectangle_color(0, 0, room_width, room_height, c_red, c_red, c_red, c_red, false);
}