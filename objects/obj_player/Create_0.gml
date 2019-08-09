/// @description Initialize variables.

// Inherit the parent event
event_inherited();

// ----------- SPRITES -----------
var aux = array_create(spr_layer_type.height, noone);
// Iddle.
aux[spr_layer_type.body]			= spr_body_keia_d_iddle;
aux[spr_layer_type.face]			= spr_face_keia_d_iddle;
aux[spr_layer_type.makeup]			= spr_makeup_keia_d_iddle;
aux[spr_layer_type.hairfront]		= spr_hairfront_keia_d_iddle;
aux[spr_layer_type.hairback]		= spr_hairback_keia_d_iddle;
aux[spr_layer_type.shoes]			= spr_shoes_keia_d_iddle;
aux[spr_layer_type.trousers]		= spr_trousers_keia_d_iddle;
aux[spr_layer_type.tshirt]			= spr_tshirt_keia_d_iddle;
aux[spr_layer_type.jacket]			= spr_jacket_keia_d_iddle;
array_copy(spr_layers[animation_state.iddle], 0, aux, 0, spr_layer_type.height);

// Walking.
aux = array_create(spr_layer_type.height, noone);
aux[spr_layer_type.body]			= spr_body_keia_d_walk;
aux[spr_layer_type.face]			= spr_face_keia_d_walk;
aux[spr_layer_type.makeup]			= spr_makeup_keia_d_walk;
aux[spr_layer_type.hairfront]		= spr_hairfront_keia_d_walk;
aux[spr_layer_type.hairback]		= spr_hairback_keia_d_walk;
aux[spr_layer_type.shoes]			= spr_shoes_keia_d_walk;
aux[spr_layer_type.trousers]		= spr_trousers_keia_d_walk;
aux[spr_layer_type.tshirt]			= spr_tshirt_keia_d_walk;
aux[spr_layer_type.jacket]			= spr_jacket_keia_d_walk;
array_copy(spr_layers[animation_state.walking], 0, aux, 0, spr_layer_type.height);
// ----------- INFO -----------
name				= "Keia";
age					= 17;

mouth_x				= 0;
mouth_y				= -15;

voice				= snd_voice_test;
voice_fast			= noone;

talk_speed			= 1;

font				= fnt_dialogue;

player_id			= instance_number(object_index) - 1;

// ----------- MOVEMENT -----------
// TODO: Adjust values.
move_speed				= 1;
jump_speed				= 4;

grav						= -.3;
move_speed_run_multiplier	= 1.5;

tilemap = layer_tilemap_get_id("Collision");

// Temp.
//global.cameras[player_id] = instance_create_layer(x, y, "Hidden", obj_camera);
camera_follow_me(player_id);