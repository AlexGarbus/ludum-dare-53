class_name GameCamera
extends Camera2D


@export var _max_player_offset := 64.0

@onready var _player: Player = %Player

func _physics_process(delta: float) -> void:
	global_position.y = min(global_position.y, _player.position.y + _max_player_offset)
