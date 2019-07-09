/// @description Variable initialization.

// Inherit the parent event
event_inherited();

// Loading zone atributes.
// Change these on the create code of the room editor.
rm = noone;

fade_color = c_black;
fade_hold = 0;

dir = 0; // Use point_direction().
x_new = 0;
y_new = 0;
x_relative = true;
y_relative = true;

// Auxiliar variables.
active = false;

// Debug only.
image_index = 0;
alarm[0] = 1;