class_name Game
extends Node


var ended := false

@onready var _end_timer: Timer = %EndTimer


func _ready() -> void:
	PlayerData.reset()
	PlayerData.game_stopwatch.started = true


func _on_finish_area_body_entered(body: Node2D) -> void:
	if !ended and body is Player:
		ended = true
		PlayerData.game_stopwatch.started = false
		_end_timer.start()


func _on_end_timer_timeout() -> void:
	get_tree().change_scene_to_file(ScenePaths.END)
