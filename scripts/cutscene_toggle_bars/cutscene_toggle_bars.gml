/// @desc Toggle on/off black bars of a cutscene.
/// @arg0 time Time for the bars animation. 0 for instant.
bars = !bars;
bars_timer = argument0;
cutscene_next_scene();