extends Node


@onready var _jump: AudioStreamPlayer = %JumpPlayer


func _on_player_jumped() -> void:
	_jump.play()
