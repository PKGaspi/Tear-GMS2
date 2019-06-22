/// @desc Opens the secure config file if exists into a ds map.

if (file_exists("config.dat")) {
	global.config = ds_map_secure_load("config.dat");
}
else {
	global.config = config_create();
}
