/// @desc Opens the secure save file if exists into a ds map.
/// @arg0 save_id The file to open.

var file = "save_" + string(argument0) + ".sav";
if (file_exists(file)) {
	// There is a save file for this id. Read it.
	global.save = ds_map_secure_load(file);
}
else {
	// There is no save file for this id. Create it.
	// TODO: add given name here if so.
	global.save = gamesave_create(argument0, "Gaspi");
}

if (!ds_exists(global.config, ds_type_map)) {
	// This executes if the game loads a modified save file.
	global.save = gamesave_create_hacked(argument0, "Gaspi");
	global.hacked = true;
}