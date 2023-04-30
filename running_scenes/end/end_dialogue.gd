class_name EndDialogue
extends Resource


@export var collectable_par := 10
@export var time_par := 60.0
@export_multiline var no_pars_text := "NO PAR"
@export_multiline var collectable_par_text := "COLLECTABLE PAR"
@export_multiline var time_par_text := "TIME PAR"
@export_multiline var all_pars_text := "ALL PAR"


func get_text() -> String:
	var collectable_par_reached: bool = PlayerData.inventory.collectables >= collectable_par
	var time_par_reached: bool = PlayerData.game_stopwatch.time >= time_par
	if collectable_par_reached and time_par_reached:
		return all_pars_text
	elif collectable_par_reached:
		return collectable_par_text
	elif time_par_reached:
		return time_par_text
	else:
		return no_pars_text
			
