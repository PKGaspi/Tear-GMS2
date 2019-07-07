/// @desc Move an instance to a given position in a given speed.
/// @arg0 id The id of the instance.
/// @arg1 x
/// @arg2 y
/// @arg3 relative? Wether the x and y coordinates are relative or absolute.
/// @arg4 spd The speed of the movement.

if (global.pause) exit;

var obj = argument0;
var relative = argument3;
var spd = argument4;

if (x_dest == -1) {
	if (!relative) {
		x_dest = argument1;
		y_dest = argument2;
	}
	else {
		x_dest = obj.x + argument1;
		y_dest = obj.y + argument2;
	}
}

var xx = x_dest;
var yy = y_dest;

with (obj) {
	// TODO: Set moving sprite index here.
	
	if (spd != 0 && point_distance(x, y, xx, yy) >= spd) {
		var dir = point_direction(x, y, xx, yy);
		var ldirx = lengthdir_x(spd, dir);
		var ldiry = lengthdir_y(spd, dir);
		
		// Set sprite flipping here.
		
		x += ldirx;
		y += ldiry;
	}
	else {
		// TODO: Set idle sprite here.
		
		x = xx;
		y = yy;
		
		with (other) {
			x_dest = -1;
			y_dest = -1;
			cutscene_next_scene();
		}
	}
	
	
}