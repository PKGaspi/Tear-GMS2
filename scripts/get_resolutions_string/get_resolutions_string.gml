/// @desc Returns the available resolutions as an String array.
/// @return [res1,res2,...]

var to_return;
for (i = 0; i < array_length_1d(global.RESOLUTIONS); i++) {
	var res = global.RESOLUTIONS[i];
	to_return[i] = string(res[0]) + "x" + string(res[1]);
}
return to_return;