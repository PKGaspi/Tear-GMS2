/// @desc Changes a variable value of 
/// @arg0 id The instance or object id that will be affected.
/// @arg1 variable_name_as_string The name of the variable.
/// @arg2 value The new value of the varible.

with (argument0) {
	variable_instance_set(id, argument1, argument2);
}
cutscene_scene_next();