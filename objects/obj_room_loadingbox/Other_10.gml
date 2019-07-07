/// @description Generate cutscene.

// Player id and speed.
var player_id = instance_place(x, y, obj_player);
var player_spd = player_id.move_speed * player_id.move_speed_run_multiplier;

// Ammount and direction to move in the cutscene.
var	x_move = lengthdir_x(player_spd, dir) * 40;
var y_move = lengthdir_y(player_spd, dir) * 40;

// Player position in the new room.
x_new += player_id.x * x_relative;
y_new += player_id.y * y_relative;

// Create cutscene.
cutscene_create([
	[cutscene_screen_fade, 1, fade_color],
	[cutscene_character_move, player_id, x_move, y_move, true, player_spd],
	[cutscene_wait, .3],
	[cutscene_room_goto, rm],
	[cutscene_screen_fade, 1],
	[cutscene_character_move, player_id, x_new, y_new, false, 0],
	[cutscene_character_move, player_id, x_move, y_move, true, player_spd],
]);

instance_destroy(self, false); // Destroy this trigger to avoid duplication.