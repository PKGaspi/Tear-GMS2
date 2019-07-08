/// @description Variable initialization.
event_inherited();

global.cutscene = true;

// Scene managment.
scene_info = -1;
scene = 0;
current_scene[0] = -1;

// For waiting between scenes.
timer = 0;

// For black bars to be drawn or not.
bars = false;
bars_timer = 1;
// For moving objects in a scene.
x_dest = -1;
y_dest = -1;

alarm[0] = 1;