extends Node


@onready var _collect: AudioStreamPlayer = %CollectPlayer

func _on_collectable_collected() -> void:
	_collect.play()
