/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (debug_mode) {
	instance_create_layer(0, 0, "Hidden", obj_debug);
	room_goto(rm_test);
}
else {
	room_goto_next();
}
	