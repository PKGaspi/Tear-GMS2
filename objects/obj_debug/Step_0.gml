/// @description Debug menu.

if (keyboard_check_pressed(vk_f12)) {
	global.debug_menu = !global.debug_menu;
}
if (keyboard_check_pressed(vk_f11)) {
	show_info = !show_info;
}

if (!global.debug_menu) exit;

var h_move_p = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
var v_move_p = keyboard_check_pressed(global.key_down) - keyboard_check_pressed(global.key_up);
var accept_p = keyboard_check_pressed(global.key_accept) || mouse_check_button_pressed(mb_left) || mouse_check_button(mb_right);

selected += v_move_p;
if (selected >= menu_lines) selected = 0;
if (selected <= -1) selected = menu_lines - 1;

switch (selected) {
	case 0: // Create instance of:
	obj_index += h_move_p;
	if (obj_index >= object_index) obj_index = 0;
	if (obj_index <= -1) obj_index = object_index - 1;
	if (accept_p) {
		layer_create(0, "Debug");
		instance_create_layer(mouse_x, mouse_y, "Debug", obj_index);
	}
	break;
	
	case 1: // Go to room:
	rm_index += h_move_p;
	if (rm_index >= room_last + 1) rm_index = 0;
	if (rm_index <= -1) rm_index = room_last;
	if (accept_p) {
		room_goto(rm_index);
	}
	break;
	
	case 2: // Delete instance in mouse:
	if (accept_p) {
		var inst = instance_position(mouse_x, mouse_y, all);
		instance_destroy(inst, false);
	}
	break;
	
	case 3: // Delete instance in mouse:
	if (accept_p) {
		game_restart();
	}
	break;
}