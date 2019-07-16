/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

text = [
	["Hi.", "Hola."],
	["How are you?", "¿Cómo estás?"],
	["I hope this is working correctly.", "Espero que esto esté funcionando correctamente."]
];
var vw = global.view_width;
var vh = global.view_height;
var offset = 3;
var h = 40;
dialogue_box_create(spr_dialogue_bubble_white_black, offset, vh - offset - h, vw - offset, vh - offset, text, noone);