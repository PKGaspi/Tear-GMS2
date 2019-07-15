/// @description Fixes fullscreen to window size.
set_resolution(global.resolution);
if (destroy) {
	instance_destroy();
}
else {
	destroy = true;
}