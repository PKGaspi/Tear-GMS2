var i = 0;
repeat (spr_layer_type.height) {
	if (spr_layers[i] != noone) {
		draw_sprite(spr_layers[i], 0, x, y);
	}
	i++;
}