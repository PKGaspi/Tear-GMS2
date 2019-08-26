var keia = instance_nearest(x, y, obj_player);
var teacher = noone;
var keia_text = [
	["My name is Keia.", "Mi nombre es Keia."], 
	["Keia Nason.", "Keia Nason."], 
	["And today...", "Y hoy..."],
	["Today is the day I'm saving the world", "Hoy es el día en el que salvo al mundo."],
	["The world will be safe.", "El mundo estará a salvo."],
	["The world will be grateful.", "El mundo estará agradecido."],
	["But most importantly...", "Pero lo más importante..."],
];
var w = global.INTENDED_WIDTH;
var h = global.INTENDED_HEIGHT;
scene_info = [
	[cutscene_screen_fade, 0, c_black],
	//[cutscene_wait, 2],
	[cutscene_character_move, keia, -1, 0, true, 1], // Make Keia face left.
	[cutscene_dialogue_box_create, c_black, c_black, 20, h / 2 - 10, w - 20, h / 2 + 10, keia_text, keia], // Keia is dreaming.
	[cutscene_wait_le_instances, obj_dialogue_box, 0],
	// A voice starts to interrupt.
	[cutscene_screen_shake, 0, 1, 3],
	[cutscene_dialogue_box_create, c_black, c_black, 20, 20, 100, 100, [["Keia...", "Keia..."]], teacher],
	[cutscene_wait, .5],
	[cutscene_dialogue_box_create, c_black, c_black, 120, 20, w - 20, 30, [["No...", "No..."]], keia],
	[cutscene_wait_le_instances, obj_dialogue_box, 0],
	[cutscene_screen_shake, 0, 1, 7],
	[cutscene_dialogue_box_create, c_black, c_black, 20, 20, 100, 100, [["Keia!", "¡Keia!"]], teacher],
	[cutscene_wait, .5],
	[cutscene_dialogue_box_create, c_black, c_black, 120, 20, w - 20, 30, [["No! Not now!", "¡No! ¡Ahora no!"]], keia],
	[cutscene_wait_le_instances, obj_dialogue_box, 0],
	[cutscene_screen_shake, 0, 1, 7],
	[cutscene_dialogue_box_create, c_black, c_black, 20, 20, 100, 100, [["Keia! Wake up!", "¡Keia! ¡Despierta!"]], teacher],
	[cutscene_wait_le_instances, obj_dialogue_box, 0],
	[cutscene_screen_fade, .1],
	// Keia wakes up and she is in class.
	// The teacher asks Keia to answer the question.
	// Long uncomfortable silence.
	// Bad kid 1 laughs at Keia.
	// The whole class laughs.
	// Bad kid 2 makes another joke.
	// The whole class laughs again.
	// The teacher asks for silence. She is about to ask Keia the question again but Keia starts crying.
	// Keia runs out of the class.
	// You can see Keia running right out through the class window.
	// Screen fades black.
];