extends Node


@onready var _pluck: AudioStreamPlayer = %PluckPlayer


func _on_plant_pluck_time_shortened(_value) -> void:
	_pluck.play()
