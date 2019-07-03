/// @description Add entries, short grid and draw.

// Resize existing grid.
var depthgrid = ds_depthgrid;
var inst_number = instance_number(obj_parent_depth);
ds_grid_resize(depthgrid, 2, inst_number);

// Fill the grid with instances ids.
var yy = 0;
with (obj_parent_depth) {
	depthgrid[# 0, yy] = id;
	depthgrid[# 1, yy] = y + z;
	yy++;
}

// Short grid in ascending y.
ds_grid_sort(depthgrid, 1, true);

// Loop through the grid and draw the instances in order.
var inst_id;
yy = 0;
repeat (inst_number) {
	inst_id = depthgrid[# 0, yy];
	with (inst_id) {
		event_perform(ev_draw, 0);
	}
	yy++;
}
	
ds_grid_clear(ds_depthgrid, 0);
