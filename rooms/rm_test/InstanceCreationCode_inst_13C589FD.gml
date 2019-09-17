var keia_text = [
	["I shouldn't go there.", "No debería ir por allí."]
];
var keia = instance_nearest(x, y, obj_player);

scene_info = [
	[cutscene_dialogue_bubble_create, c_black, c_white, keia_text, keia],
	[cutscene_wait_le_instances, obj_dialogue_bubble, 0],
	[cutscene_character_move, obj_player, -20, 0, true, obj_player.move_speed]
];