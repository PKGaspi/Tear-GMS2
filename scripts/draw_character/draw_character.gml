draw_set_alpha(1);
var i = 0;
var spr_array = spr_layers[spr_animation];
var spr;
repeat (spr_layer_type.height) {
	spr = spr_array[i];
	if (spr != noone) {
		draw_sprite(spr, spr_subimage, x, y);
	}
	i++;
}

var spr_spd = sprite_get_speed(spr_array[spr_layer_type.body]);
spr_frame++;
spr_frame %= 60 / spr_spd;

spr_subimage += (spr_frame == 0) % sprite_get_number(spr);