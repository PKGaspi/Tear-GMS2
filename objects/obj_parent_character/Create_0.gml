/// @description Variable initialization.

event_inherited();

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

dir					= 0; // Direction.

x_move				= 0; // To move on x axis.
y_move				= 0; // To move on y axis.
z_move				= 0; // To move on z axis.