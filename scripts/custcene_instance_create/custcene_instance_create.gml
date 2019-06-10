/// @desc Creates an instance of a given object and advances the scene of the cutscene.
/// @arg0 x The x position of the instance.
/// @arg1 y The y position of the instance.
/// @arg2 layer_id_or_name The id or name of the layer to create the instance on.
/// @arg3 obj The object of the instance to be created.
/// @return inst_id The id of the new instance.

var inst = instance_create_layer(argument0, argument1, argument2, argument3);
cutscene_next_scene();

return inst;