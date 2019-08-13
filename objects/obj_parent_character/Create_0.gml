/// @description Variable initialization.

event_inherited();

// ----------- SPRITE LAYERS -----------

enum spr_layer_type {
	hairback,
	body,
	face,
	makeup,
	hat,
	shoes,
	trousers,
	tshirt,
	jacket,
	hairfront,
	height
}

enum animation_state {
	iddle,
	walk,
	run,
	height
}

// Create array of layers.

// Create an array for each animation.
var i = 0;
repeat (animation_state.height) {
	var j = 0;
	var arr = array_create(spr_layer_type.height, noone);
	// Crete an array for each layer.
	repeat (spr_layer_type.height) {
		// An entry for each direction.
		arr[j] = array_create(8, noone);
		j++;
	}
	spr_layers[i] = arr;
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