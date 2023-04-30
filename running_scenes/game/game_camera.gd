class_name GameCamera
extends Camera2D


@export var _max_player_offset := 64.0

@onready var _player: Player = %Player

func _physics_process(delta: float) -> void:
	var _target_height: float = round(_player.position.y + _max_player_offset)
	global_position.y = min(global_position.y, _target_height)


func _on_world_boundary_body_entered(body: Node2D) -> void:
	global_position.y = round(_player.global_position.y)
