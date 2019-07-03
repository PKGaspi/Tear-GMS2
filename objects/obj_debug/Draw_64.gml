/// @description Draw debug menu.

draw_set_font(fnt_debug);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Draw the background.
draw_set_color(c_black);
draw_set_alpha(.7);
var total_lines = 1 + global.debug_menu * (menu_lines + 1 + show_info * info_lines);

draw_rectangle(0, 0, global.view_width, total_lines * text_line_space, false);

// Draw the menu.
draw_set_color(c_white);
draw_set_alpha(1);

// Exit if the menu is closed.
if (!global.debug_menu) {
	draw_text_size(0, 0, "Pulsa f12 para abrir el menú de debug.", text_scale);
	exit;
}

// Draw a circle that marks the selected entry.
draw_circle(0, selected * text_line_space + 1, 1, 0);

// Draw the entries.
var line = 0;
draw_text_size(2, line * text_line_space, "Crear instancia de " + object_get_name(obj_index), text_scale); line++;
draw_text_size(2, line * text_line_space, "Ir a la habitación " + room_get_name(rm_index), text_scale); line++;
draw_text_size(2, line * text_line_space, "Destruir la instancia bajo el ratón.", text_scale); line++;
// Draw info and stats.
if (show_info) {
	draw_text_size(0, line * text_line_space, "---------- INFO ----------", text_scale); line++;
	draw_text_size(0, line * text_line_space, "Habitación actual: " + room_get_name(room) + " - Tamaño de la habitación: " + string(room_width) + "x" + string(room_height), text_scale); line++;
	draw_text_size(0, line * text_line_space, "Posición del ratón: " + string(mouse_x) + " " + string(mouse_y), text_scale); line++;
	draw_text_size(0, line * text_line_space, "FPS: " + string(fps) + " - Número de instacias: " + string(instance_count), text_scale); line++;
	draw_text_size(0, line * text_line_space, "Resolución de la pantalla: " + string(global.DISPLAY_WIDTH) + "x" + string(global.DISPLAY_HEIGHT) + " - Tamaño de la ventana: " + string(global.RESOLUTIONS[0, global.resolution]) + "x" + string(global.RESOLUTIONS[1, global.resolution]) + " - Pantalla completa: " + boolean_to_yesno(global.fullscreen), text_scale); line++;
	draw_text_size(0, line * text_line_space, "Versión: " + string(GM_version) + " - Fecha de compilación: " + date_datetime_string(GM_build_date), text_scale); line++;

	draw_text_size(0, line * text_line_space, "Pulsa f11 para mostrar menos información.", text_scale); line++;
}
else{
	draw_text_size(0, line * text_line_space, "Pulsa f11 para mostrar más información.", text_scale); line++;
}
draw_text_size(0, line * text_line_space, "Pulsa f12 para cerrar el menú de debug.", text_scale); line++;