/// @description Variable initialization.

// ----------- SPRITE LAYERS -----------

enum spr_layer_type {
	hairback,
	body,
	skin,
	makeup,
	hairfront,
	hat,
	shoes,
	trousers,
	tshirt,
	jacket,
	height
}

// Create array of layers.
var i = 0;
repeat (spr_layer_type.height) {
	spr_layers[i] = noone;	
	i++;
}
