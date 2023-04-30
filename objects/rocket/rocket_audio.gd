extends Node


@onready var _rocket: AudioStreamPlayer = %RocketPlayer


func _on_rocket_enabled() -> void:
	_rocket.play()
