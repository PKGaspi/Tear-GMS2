/// @description Variable initialization.

event_inherited();

// ----------- SPRITE LAYERS -----------

enum spr_layer_type {
	hairback,
	body,
	face,
	makeup,
	hairfront,
	hat,
	shoes,
	trousers,
	tshirt,
	jacket,
	height
}

enum animation_state {
	iddle,
	walking,
	running,
	height
}

// Create array of layers.
var i = 0;
repeat (animation_state.height) {
	spr_layers[i] = array_create(spr_layer_type.height, noone);
	i++;
}
spr_animation = animation_state.iddle;
spr_frame = 0;
spr_subimage = 0;

// Character values.
dir					= 0; // Direction.

x_move				= 0; // To move on x axis.
y_move				= 0; // To move on y axis.
z_move				= 0; // To move on z axis.