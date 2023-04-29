class_name Game
extends Node


var _player_spawn: Vector2


@onready var _camera: GameCamera = %GameCamera
@onready var _player: Player = %Player


func _ready() -> void:
	_player_spawn = _player.global_position


func respawn() -> void:
	_player.global_position = _player_spawn
	_camera.global_position.y = _player.global_position.y


func _on_world_boundary_body_entered(body: Node2D) -> void:
	if body is Player:
		respawn()
