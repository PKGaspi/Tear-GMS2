/// @description Draw debug menu.

var line = 0;
draw_set_font(fnt_debug);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Draw the background.
draw_set_color(c_black);
draw_set_alpha(.6);
var total_lines = 1 + (global.debug_menu * menu_lines) + (show_info * info_lines);

draw_rectangle(0, 0, global.view_width, total_lines * text_line_space, false);

// Draw the menu.
draw_set_color(c_white);
draw_set_alpha(1);

draw_text_size(0, 0, "Press f12 to open/close the debug menu. Press f11 to show/hide more information.", text_scale); line++;
// Exit if the menu is closed.
if (global.debug_menu) {
	// Draw the debug menu.
	draw_text_size(2, line * text_line_space, "Create instance of an object under the mouse. ----------- <" + object_get_name(obj_index) + ">", text_scale); line++;
	draw_text_size(2, line * text_line_space, "Go to selected room. ----------- <" + room_get_name(rm_index) + ">", text_scale); line++;
	draw_text_size(2, line * text_line_space, "Destroy instance under mouse.", text_scale); line++;
	draw_text_size(2, line * text_line_space, "Make the camera follow an object under the mouse.", text_scale); line++;
	draw_text_size(2, line * text_line_space, "Teleport player under mouse  position.", text_scale); line++;
	draw_text_size(2, line * text_line_space, "Show / hide invisible objects.", text_scale); line++;
	draw_text_size(2, line * text_line_space, "Restart the game.", text_scale); line++;

	// Draw a circle that marks the selected entry.
	draw_circle(0, (selected + 1) * text_line_space + 1, 1, 0);

}

if (show_info) {
	// Draw info and stats.
	draw_text_size(0, line * text_line_space, "---------- INFO ----------", text_scale); line++;
	draw_text_size(0, line * text_line_space, "Current room: " + room_get_name(room) + " | Room size: " + string(room_width) + "x" + string(room_height), text_scale); line++;
	draw_text_size(0, line * text_line_space, "Mouse position: " + string(mouse_x) + " " + string(mouse_y), text_scale); line++;
	draw_text_size(0, line * text_line_space, "FPS: " + string(fps) + " | Number of instancese: " + string(instance_count), text_scale); line++;
	draw_text_size(0, line * text_line_space, "Display resolution: " + string(global.DISPLAY_WIDTH) + "x" + string(global.DISPLAY_HEIGHT) + " | Window size: " + string(global.RESOLUTIONS[0, global.resolution]) + "x" + string(global.RESOLUTIONS[1, global.resolution]) + " | Fullscreen: " + boolean_to_yesno(global.fullscreen), text_scale); line++;
	draw_text_size(0, line * text_line_space, "Camera position: " + string(global.cameras[0].x) + " " + string(global.cameras[0].y) + " | Camera following: " + string(global.cameras[0].follow) + " | Camera zoom: " + string(global.cameras[0].zoom), text_scale); line++;
	draw_text_size(0, line * text_line_space, "Version: v" + string(GM_version) + " | Build date: " + date_datetime_string(GM_build_date), text_scale); line++;
}
