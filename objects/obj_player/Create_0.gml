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
h_speed				= 1;
v_speed				= 1;
h_run_extra_speed	= 1.5;
v_run_extra_speed	= 1.5;

dir					= 0;

x_move				= 0;
y_move				= 0;

obj_camera.follow	= self;