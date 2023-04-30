class_name Game
extends Node


@onready var _camera: GameCamera = %GameCamera
@onready var _player: Player = %Player


func _ready() -> void:
	PlayerData.reset()
	PlayerData.game_stopwatch.started = true


func _on_finish_area_body_entered(body: Node2D) -> void:
	if body is Player:
		PlayerData.game_stopwatch.started = false
		get_tree().change_scene_to_file(ScenePaths.END)
