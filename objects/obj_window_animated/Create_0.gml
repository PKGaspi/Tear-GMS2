/// @description Variable initialization.

// Sprites.
border_sprite = noone;
inside_sprite = noone;
border_stretch = false;
c_back = c_black;
back_alpha = noone;

// Position.
x1 = 0;
y1 = 0;
x2 = 0;
y2 = 0;

// Animation variables.
spd = 0;
offset = 0;
dir = 0;

dir_x = sign(lengthdir_x(1, dir));
dir_y = sign(lengthdir_y(1, dir));

alarm[0] = 1;