/// @description Initialize everything.

// Destroy if there is another instance of this object.
event_inherited();
destroy = 0;

// Load audio groups.
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);

#region // Setup tile collision.
#macro TILE_SIZE 16
heights_to_get = 64 //sprite_get_width(spr_ts_collision);
tiles = heights_to_get / TILE_SIZE;

// Create Tiles
var layerid = layer_create(0, "Collision");
tilemapid = layer_tilemap_create(layerid, 0, 0, ts_collision, tiles, 1);

var i = 0;
repeat (tiles) {
	tilemap_set(tilemapid, i, i, 0);
	i++;
}
#endregion

// Control variables.
global.pause				= false; // Whether the game is paused or not.
global.cutscene				= false; // Whether a cutscene is running or not.
global.debug_menu			= false; // Whether the debug menu is active or not.
global.hacked				= false; // Whether some secure file is modified or not.
global.cameras				= array_create(0); // Cameras array.

// Video constants.
global.INTENDED_WIDTH		= 240;
global.INTENDED_HEIGHT		= 135;
global.DISPLAY_WIDTH		= display_get_width();
global.DISPLAY_HEIGHT		= display_get_height();

global.RESOLUTIONS = [
	[960, 540],
	[1280, 720],
	[1920, 1080],
	[2560, 1440],
	[3840, 2160]
];

var len = array_length_1d(global.RESOLUTIONS);
var res = global.RESOLUTIONS[len - 1];
while (res[0] >= global.DISPLAY_WIDTH || res[1] >= global.DISPLAY_HEIGHT) {
	var aux = array_create(len - 1);
	array_copy(aux, 0, global.RESOLUTIONS, 0, len - 1);
	global.RESOLUTIONS = aux;
	var len = array_length_1d(global.RESOLUTIONS);
	var res = global.RESOLUTIONS[len - 1];
}
var tmp;
switch (display_aa) {
	case 2 : tmp = [0, 2]; break;	
	case 6 : tmp = [0, 2, 4]; break;	
	case 12: tmp = [0, 4, 8]; break;	
	case 14: tmp = [0, 2, 4, 8]; break;
	default: tmp = [0]; break;
}
global.ANTIALIASING_VALUES = tmp;

// Color variables.
global.c_purple_0				= color_change_endianness($ab47bc);
global.c_deep_purple_0			= color_change_endianness($311b92);
global.c_deep_purple_1			= color_change_endianness($000063);

// Load configuration.
config_load();

// Setup camera, menu object and draw object.
instance_create_layer(x, y, "Menus", obj_camera);
instance_create_layer(x, y, "Hidden", obj_pause_menu);
instance_create_layer(x, y, "Hidden", obj_draw_depth);

alarm[0] = 2; // Fixes fullscreen to window size.

// */