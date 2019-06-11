/// @desc cutscene_wait Wait an specific amount of time on a cutscene.
/// @arg seconds The number of seconds to wait.

if (global.pause) exit;

timer++;

if (timer >= argument0 * room_speed) {
	timer = 0;
	cutscene_next_scene();
}