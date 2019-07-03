/// @description Destroy if there is more of this object.
unique = true;
if (instance_number(object_index) > 1) {
	unique = false;
	instance_destroy(self, false);
	exit;
}