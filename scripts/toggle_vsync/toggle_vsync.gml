/// @desc toggles vsync on/off.
global.vsync = !global.vsync;
display_reset(global.antialiasing, global.vsync);