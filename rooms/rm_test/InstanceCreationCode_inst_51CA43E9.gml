var keia_text = [
	["Good for you.", "Pues muy bien."]
];
var keia = instance_nearest(x, y, obj_player);

scene_info = [
	[cutscene_dialogue_bubble_create, c_black, c_white, keia_text, keia],
	[cutscene_wait_le_instances, obj_dialogue_bubble, 0],
];
cutscene_id = 0;