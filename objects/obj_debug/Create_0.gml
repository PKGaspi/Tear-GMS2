/// @description Variable initialization.

// Destroy if there is another instance of this object.
event_inherited();

global.debug_menu			= false;
show_info					= false
text_scale					= 12;
text_line_space				= 4;

obj_index					= 0;
rm_index					= 0;

selected					= 0;
menu_lines					= 4; // The number of entries in the debug menu.
info_lines					= 6; // The number of info lines in the debug menu.