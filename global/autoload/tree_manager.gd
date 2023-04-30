extends Node


func _unhandled_input(event: InputEvent) -> void:
	if OS.get_name() != "Web" and event.is_action_pressed("quit"):
		get_tree().quit()
