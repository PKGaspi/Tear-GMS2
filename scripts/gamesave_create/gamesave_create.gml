/// @desc Creates a save file with initial values.
/// @arg0 save_id The file to open.
/// @arg1 player The player name.
/// @ret save A ds_map with the initial state of the game.

// Creation of different ds.
var save = ds_map_create();
var ds_inventory = ds_list_create(); // Assuming the inventory is infinite no more setup is needed.
var ds_clothes = ds_list_create();
var ds_bestiary = bestiary_create();

// Player given data.
save[? "save_id"]			= argument0;
save[? "player_name"]		= argument1;

// Position.
save[? "room"]				= rm_test;
save[? "x"]					= 30;
save[? "y"]					= 40;

// Inventory.
save[? "inventory"]			= ds_inventory;
save[? "clothes"]			= ds_clothes;
save[? "bestiary"]			= ds_bestiary;

return save;