/// @desc Creates a dialogue box with the given text and advances the scene of a cutscene.
/// @arg0 sprite Index of the sprite to draw.
/// @arg1 x1 The x position of the left border of the window.
/// @arg2 y1 The y position of the top border of the window.
/// @arg3 x2 The x position of the right border of the window.
/// @arg4 y2 The y position of the bottom border of the window.
/// @arg5 text Array of arrays of the texts in multiple languages.
/// @arg6 speaker

dialogue_box_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7);
cutscene_next_scene();