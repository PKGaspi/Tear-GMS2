/// @description Update animation direction and check if properly created.

dir_x = sign(lengthdir_x(1, dir));
dir_y = sign(lengthdir_y(1, dir));
if (border_sprite == noone && inside_sprite == noone) {
	instance_destroy(self, true);
}