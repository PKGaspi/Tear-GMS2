/// @desc Creates a menu page.
/// @arg [["Name1en", "Name1es"],sprite1,type1,entries1...]
/// @arg [["Name2en", "Name2es"],sprite2,type2,entries2...]

var arg;
for (i = 0; i < argument_count; i++) {
	arg[i] = argument[i];
}

var ds_grid_id = ds_grid_create(6, argument_count);

var yy = 0;
repeat (argument_count) {
	var array = arg[yy];
	var array_len = array_length_1d(array);
	var xx = 0;
	repeat (array_len) {
		ds_grid_id[# xx, yy] = array[xx];
		xx++;
	}
	yy++;
}

return ds_grid_id;