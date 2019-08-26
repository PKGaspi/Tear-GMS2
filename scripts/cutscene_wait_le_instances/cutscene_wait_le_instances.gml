/// @desc waits until there is less than or the desired number of
/// instances of an object and the advances the scene of the cutscene.
/// @arg0 obj_id Object id of instances to check for.
/// @arg1 num Minimun number of instances to wait for (<=).

if (instance_number(argument0) <= argument1) {
	cutscene_scene_next();
}