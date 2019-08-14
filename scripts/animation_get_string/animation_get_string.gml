/// @desc Returns the string of an animation index.
/// @arg0 index Animation index.

switch (argument0) {
	case animation_state.iddle: return "iddle";
	case animation_state.walk: return "walk";
	case animation_state.run: return "run";
}

return -1;