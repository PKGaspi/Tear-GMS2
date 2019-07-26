/// @description Build height table.
// Draw the tiles.
var surface = surface_create(global.INTENDED_WIDTH, global.INTENDED_HEIGHT);
surface_set_target(surface);
draw_tilemap(tilemapid, 0, 0);

// Create the height arrays.
global.collision_heights_top = array_create(heights_to_get, 16);
global.collision_heights_bottom = array_create(heights_to_get, 16);
var i = TILE_SIZE; // Start after the empty tile.
repeat (heights_to_get - TILE_SIZE) {
	var check = 0;
	while (check < TILE_SIZE) {
		global.collision_heights_top[i] = check;
		if (surface_getpixel(surface, i, check) != c_black) break;
		check++;
	}
	check = TILE_SIZE;
	while (check > 0) {
		global.collision_heights_bottom[i] = TILE_SIZE - check;
		if (surface_getpixel(surface, i, check - 1) != c_black) break;
		check--;
	}
	i++;
}

surface_reset_target();
// Destroy if everything else is initialized.
if (destroy >= 3) {
	instance_destroy();
}
else {
	destroy++;
}