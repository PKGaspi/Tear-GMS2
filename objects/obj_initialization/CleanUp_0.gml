/// @description Clean data structures.
if (ds_exists(global.config, ds_type_map)) {
	ds_map_destroy(global.config);
}