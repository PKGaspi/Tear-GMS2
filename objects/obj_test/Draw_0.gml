/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (!draw) exit;
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//draw_text(90, 90, string(string_width("i")));
//draw_text_ext_transformed(40, 40, "This is a very long string, let's see how it ends up looking lmao :)", 100, 2000, .03, .03, 0);

//draw_text_size(100, 100, "This is a very long string,\n let's see how it ends up looking lmao :)", 20);
draw_border(10, 10, 70, 70, 1, c_white);
draw_text_ext_size(40, 40, long_text, 1, 30, 20);