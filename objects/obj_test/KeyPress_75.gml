/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (!audio_is_playing(msc_test)) {
	audio_play_sound(msc_test, 1, true);
}
text = [
	["* heya.", "Hola."],
	["* ...", "..."],
	["* you didn't expect that, did you?", "Espero que esto esté funcionando correctamente."],
	["* ;)", ";)"],
	["* how are you?", "¿Cómo estás?"],
	["* " + string_lower(long_text), long_text]
];
cutscene_create([
	[cutscene_dialogue_bubble_create, c_black, c_white, text, instance_nearest(x, y, obj_player)],
	[cutscene_wait_le_instances, obj_parent_dialogue, 0]
]);