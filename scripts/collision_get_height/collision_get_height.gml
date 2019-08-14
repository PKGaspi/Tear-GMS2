/// @desc Checks vertical distance to a collision tile.
/// @arg0 tilemap
/// @arg1 x
/// @arg2 y
/// @arg3 distance_table The global variable with the distance table to check.

var tilemap = argument0;
var _x = argument1;
var _y = argument2;
var table = argument3;

var tile = tilemap_get_at_pixel(tilemap, _x, _y);
if (tile < 0) return 16;
var distance = table[_x mod TILE_SIZE + tile * TILE_SIZE];
return distance;