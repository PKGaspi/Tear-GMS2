/// @desc Returns an array with the parameters for drawing.
var parameters;
parameters[0] = draw_get_alpha();
parameters[1] = draw_get_color();
parameters[2] = draw_get_font();
parameters[3] = draw_get_halign();
parameters[4] = draw_get_lighting();
parameters[5] = draw_get_swf_aa_level();
parameters[6] = draw_get_valign();
return parameters;