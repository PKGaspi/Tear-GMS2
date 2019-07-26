/// @description Fixes fullscreen to window size.
var res = get_resolution();
window_resize(res[0], res[1]);

// Destroy if everything else is initialized.
if (destroy >= 3) {
	instance_destroy();
}
else {
	destroy++;
}