/// @description Add entries, short grid and draw.

if (ds_exists(ds_depthgrid, ds_type_grid)) {
	var depthgrid = ds_depthgrid;
	var inst_number = instance_number(obj_parent_depth);
	ds_grid_resize(depthgrid, 2, inst_number);
	
	var yy = 0;
	with (obj_parent_depth) {
		depthgrid[# 0, yy] = id;
		depthgrid[# 1, yy] = y;
		yy++;
	}
	
	ds_grid_sort(depthgrid, 1, true);
	
	yy = 0;
	repeat (inst_number) {
		var inst_id = depthgrid[# 0, yy];
		with (inst_id) {
			if (object_is_ancestor(object_index, obj_character) || object_index == obj_character) {
				draw_character();
			}
			else {
				draw_self();
			}
		}
		yy++;
	}
	
	ds_grid_clear(ds_depthgrid, 0);
}