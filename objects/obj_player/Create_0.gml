/// @description Initialize variables.

// Inherit the parent event
event_inherited();

// ----------- SPRITES -----------
spr_layers[spr_layer_type.body]			= spr_body_000_d;
spr_layers[spr_layer_type.skin]			= spr_skin_000_d;
spr_layers[spr_layer_type.makeup]		= spr_makeup_000_d;
spr_layers[spr_layer_type.hairfront]	= spr_hairfront_000_d;
spr_layers[spr_layer_type.hairback]		= spr_hairback_000_d;
spr_layers[spr_layer_type.shoes]		= spr_shoes_000_d;
spr_layers[spr_layer_type.trousers]		= spr_trousers_000_d;
spr_layers[spr_layer_type.tshirt]		= spr_tshirt_000_d;
spr_layers[spr_layer_type.jacket]		= spr_jacket_000_d;

// ----------- INFO -----------
name				= "Keia";
age					= 17;

// ----------- MOVEMENT -----------
// TODO: Adjust values.
move_speed				= 1;
jump_speed				= 4;

grav						= -.3;
move_speed_run_multiplier	= 1.5;

// Temp.
obj_camera.follow	= self;