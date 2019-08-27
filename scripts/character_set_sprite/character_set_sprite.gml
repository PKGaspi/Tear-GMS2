/// @desc Sets the sprite of the corresponding layer to a character.
/// @arg0 spr_str A string with the initial part of the sprite to set.
/// @arg1 layer The layer index to set the sprite into.

// Argument collection.
var spr_str = "spr_" + argument0;
var lyr = argument1;

var i = 0;
repeat (animation_state.height) {
	// Set the sprite for all animations.
	var animation = animation_get_string(i);
	array_set(array_get(spr_layers[i], lyr), 0, asset_get_index(spr_str + "_" + animation + "_r"));
	array_set(array_get(spr_layers[i], lyr), 1, asset_get_index(spr_str + "_" + animation + "_ru"));
	array_set(array_get(spr_layers[i], lyr), 2, asset_get_index(spr_str + "_" + animation + "_u"));
	array_set(array_get(spr_layers[i], lyr), 3, asset_get_index(spr_str + "_" + animation + "_lu"));
	array_set(array_get(spr_layers[i], lyr), 4, asset_get_index(spr_str + "_" + animation + "_l"));
	array_set(array_get(spr_layers[i], lyr), 5, asset_get_index(spr_str + "_" + animation + "_ld"));
	array_set(array_get(spr_layers[i], lyr), 6, asset_get_index(spr_str + "_" + animation + "_d"));
	array_set(array_get(spr_layers[i], lyr), 7, asset_get_index(spr_str + "_" + animation + "_rd"));
	i++;
}
