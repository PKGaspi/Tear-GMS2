/// @desc Returns "Yes" if the given boolean is true and "No" if not (for each language).
/// @arg0 value

switch (get_language_num(global.language)) {
	case 0: if (argument0) return "Yes"; else return "No";
	case 1: if (argument0) return "Sí"; else return "No";
}