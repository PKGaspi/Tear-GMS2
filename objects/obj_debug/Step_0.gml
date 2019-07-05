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
var accept_p = keyboard_check_pressed(global.key_accept) || mouse_check_button_pressed(mb_left);
var accept_h = mouse_check_button(mb_right);
selected += v_move_p;
if (selected >= menu_lines) selected = 0;
if (selected <= -1) selected = menu_lines - 1;

switch (selected) {
	case 0: // Create instance of:
	obj_index += h_move_p;
	if (obj_index >= object_index) obj_index = 0;
	if (obj_index <= -1) obj_index = object_index - 1;
	if (accept_p || accept_h) {
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
	
	case 2: // Delete instance under mouse:
	if (accept_p || accept_h) {
		var inst = instance_position(mouse_x, mouse_y, all);
		instance_destroy(inst, false);
	}
	break;
	
	case 3: // Make the camera follow the object under mouse:
	if (accept_p || accept_h) {
		var inst = instance_position(mouse_x, mouse_y, all);
		camera_follow_instance(0, inst);
	}
	break;
	
	case 4: // Move the player to cursor position:
	if (accept_p || accept_h) {
		if (instance_exists(obj_player)){
			var inst = instance_nearest(mouse_x, mouse_y, obj_player);
			inst.x = mouse_x; inst.y = mouse_y;
		}
	}
	break;
	
	case 5: // Delete instance in mouse:
	if (accept_p) {
		game_restart();
	}
	break;
}