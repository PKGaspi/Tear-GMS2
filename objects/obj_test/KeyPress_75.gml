/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
text = [
	["Hi.", "Hola."],
	[" ", " "],
	["I hope this is working correctly.", "Espero que esto esté funcionando correctamente."],
	["How are you?", "¿Cómo estás?"],
	[long_text, long_text]
];
dialogue_bubble_create(spr_dialogue_bubble_white_black, text, instance_nearest(x, y, obj_player));