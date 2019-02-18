/// @desc Returns c_black or c_white deppending on what makes better contrast with color.
/// @arg0 color

if (contrast(argument0, c_white) >= contrast(argument0, c_black)) {
	return c_white;	
}
else {
	return c_black;
}