/// @desc Returns the numeric code of the language in use.
/// @arg0 language_name
var lang = argument0;
switch (lang) {
	case "en": return 0;
	case "es": return 1;
	default: return lang;
}