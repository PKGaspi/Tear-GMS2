/// @desc Opens the secure config file if exists into a ds map.

if (file_exists("config.dat")) {
	// There is a config.dat file. Read it.
	global.config = ds_map_secure_load("config.dat");
}
else {
	// There is no config.dat file. Create it.
	global.config = config_create();
}

if (!ds_exists(global.config, ds_type_map)) {
	// This executes if the game loads a modified game.
	global.config = config_create();
	global.hacked = true;
}