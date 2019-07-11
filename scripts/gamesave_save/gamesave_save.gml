/// @desc Save the game state into a file.
/// @arg0 file_id The file to save it to.

// Open the save file.
gamesave_open(argument0);

// TODO: Do all of this in a cutscene or something cool looking.

// Auxiliar variables.
var player = instance_nearest(x, y, obj_player);

// Room and position.
global.save[? "room"] = room;
global.save[? "x"] = player.x;
global.save[? "y"] = player.y;

// Player info.
global.save[? "inventory"] = player.ds_inventory;
global.save[? "clothe"] = player.ds_clothes;
global.save[? "bestiary"] = player.ds_bestiary;

ds_map_secure_save(global.save, "save_" + string(argument0) + ".sav");

// TODO: Ask to continue playing or go to the main menu. Or don't do
// so, idk what is the best option. Maybe if the player just wants to
// continue he'll continue and if he (or she now that i think about it)
// wants to quit he/she will do so by opening the menu. Have a nice day
// when you read this by the way. 
//(I twitted a picture of this comment after writing it. Go search it.)









