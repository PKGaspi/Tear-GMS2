/// @desc Zooms the camera in or out.
/// @arg0 zoom The factor to zoom.
/// @arg1 zoom_sp The speed to zoom at.
var z_sp = argument1;
var new_width = floor(global.view_width * argument0);
var new_height = floor(global.view_height * argument0);

new_width += 16 - new_width % 16;
new_height += 9 - new_height % 9;

with (obj_camera) {
	width_to = new_width;
	height_to = new_height;
	zoom = argument0;
	zoom_sp = z_sp;
}