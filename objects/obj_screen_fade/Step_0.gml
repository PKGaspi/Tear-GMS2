/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (global.pause) exit;
if (alpha <= abs(fade) && active) {
	alpha += fade / frames;
	if (alpha > abs(fade)) {
		alpha = fade;
	}
	if (alpha <= 0) {
		instance_destroy(self, false);
	}

}