/// @description Draw fade effect.

if (alpha <= abs(fade) && active) {
	alpha += fade / frames;
	draw_set_alpha(alpha);
	draw_set_color(color);
	draw_rectangle(0, 0, global.view_width, global.view_height, false);
	if (alpha > abs(fade)) {
		alpha = fade;
	}
	if (alpha <= 0) {
		instance_destroy(self, false);
	}
}

