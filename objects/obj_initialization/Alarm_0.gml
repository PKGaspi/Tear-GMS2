/// @description Fixes fullscreen to window size.
var res = get_resolution();
window_resize(res[0], res[1]);

if (destroy) {
	instance_destroy();
}
else {
	destroy = true;
}