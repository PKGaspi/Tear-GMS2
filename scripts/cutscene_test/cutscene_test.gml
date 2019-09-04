/// @desc tests cutscenes

if (mouse_check_button_pressed(mb_left)){
	instance_create_layer(mouse_x, mouse_y, "Depth", obj_draw_test);
	cutscene_scene_next();
}
