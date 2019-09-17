/// @desc Load a save file into the game state.
/// @arg0 file_id The file to load.

// Open the save file.
gamesave_open(argument0);

// Auxiliar variables.
var rm = global.save[? "room"];
var _x = global.save[? "x"];
var _y = global.save[? "y"];

var ds_inventory = global.save[? "inventory"];
var ds_clothes = global.save[? "clothe"];
var ds_bestiary = global.save[? "bestiary"];

// TODO: Do all of this in a cutscene or something cool looking.
// Load the room and player.
room_goto(rm);

// TODO: Maybe create a script that does this properly (for multiplayer and so idk).
var player = instance_create_layer(_x, _y, "Depth", obj_player);
player.ds_inventory = ds_inventory;
player.ds_clothes = ds_clothes;
player.ds_bestiary = ds_bestiary;