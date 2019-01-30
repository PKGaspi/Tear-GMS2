/// @desc Returns the available resolutions as an String array.
/// @return [res1,res2,...]

var to_return;
for (i = 0; i < array_length_2d(global.resolutions, 0); i++) {
	to_return[i] = string(global.resolutions[0, i]) + "x" + string(global.resolutions[1, i]);
}
return to_return;