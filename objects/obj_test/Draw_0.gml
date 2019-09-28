/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var text = "This is a test.";
var size = 20;
draw_set_font(fnt_dialogue);
draw_text_size(20, 20, text, size);
draw_set_font(fnt_dialogue_20);
draw_text_size(20, 20, text, size);
draw_text(20, 60, string_width(text));
draw_text(70, 60, string_width_size(text, size));