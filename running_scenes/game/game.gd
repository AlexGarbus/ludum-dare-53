class_name Game
extends Node


var ended := false
var _end_scene := preload(ScenePaths.END).instantiate() as End


func _ready() -> void:
	PlayerData.reset()
	PlayerData.game_stopwatch.started = true


func end() -> void:
	PlayerData.game_stopwatch.started = false
	get_tree().root.add_child(_end_scene)
	get_tree().current_scene = _end_scene
	queue_free()


func _on_finish_area_body_entered(body: Node2D) -> void:
	if !ended and body is Player:
		ended = true
		end()
