/// @description Initialize variables.

// Inherit the parent event
event_inherited();

// ----------- SPRITES -----------
character_set_sprite("body_keia00", spr_layer_type.body);
character_set_sprite("jacket_keia00", spr_layer_type.jacket);
character_set_sprite("shoes_keia00", spr_layer_type.shoes);
character_set_sprite("tshirt_keia00", spr_layer_type.tshirt);
character_set_sprite("trousers_keia00", spr_layer_type.trousers);
character_set_sprite("hairback_keia00", spr_layer_type.hairback);
character_set_sprite("hairfront_keia00", spr_layer_type.hairfront);
character_set_sprite("makeup_keia01", spr_layer_type.makeup);
character_set_sprite("face_keia01", spr_layer_type.face);
// ----------- INFO -----------
name				= "Keia";
age					= 17;

mouth_x				= 0;
mouth_y				= -25;

voice				= snd_voice_keia;
voice_fast			= snd_voice_fast_keia;

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