/// @desc Advances the scene of the cutscene.
scene++;
if (scene >= array_length_1d(scene_info)){
	// Destroy the cutscene if it has finished.
	instance_destroy();	
	exit;
}

event_perform(ev_other, ev_user0);