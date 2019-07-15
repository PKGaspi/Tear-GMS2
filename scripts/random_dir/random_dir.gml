/// @desc returns a random direction different to x and y axis.
/// @ret dir A random direction.

do {
	var x1 = random_range(-1, 1);
	var y1 = random_range(-1, 1);
} until (x1 != 0 && y1 != 0)
return point_direction(0, 0, x1, y1);