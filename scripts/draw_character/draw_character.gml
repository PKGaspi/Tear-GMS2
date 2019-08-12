draw_set_alpha(1);
var i = 0;
var spr_array = spr_layers[spr_animation];
var spr;
var _dir = dir / 45;
repeat (spr_layer_type.height) {
	spr = array_get(spr_array[i], _dir);
	if (spr >= 0) {
		draw_sprite(spr, spr_subimage, x, y);
	}
	i++;
}

spr = array_get(spr_array[spr_layer_type.body], _dir);
if (spr < 0) exit;
var spr_spd = sprite_get_speed(spr);
mask_index = spr;
spr_frame++;
spr_frame %= 60 / spr_spd;

spr_subimage += (spr_frame == 0) % sprite_get_number(spr);