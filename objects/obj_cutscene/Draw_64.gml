/// @description Draw black bars if activated.
if (bars) {
	// TODO: improve bars animation. Maybe move this to a dedicated object.
	var bar_height = global.view_height / (10 * sqrt(bars_timer + 1));
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(0, 0, global.view_width, bar_height, false);
	draw_rectangle(0, global.view_height - bar_height, global.view_width, global.view_height, false);
	if (bars_timer > 0) {
		bars_timer--;
	}
}

// TODO: add animation for bars dissapearing.