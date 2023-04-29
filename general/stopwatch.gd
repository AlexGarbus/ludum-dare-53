class_name Stopwatch
extends Node

signal time_changed(value: float)

var started := false
var time := 0.0:
	get:
		return time
	set(value):
		time = value
		time_changed.emit(time)


func _process(delta: float) -> void:
	if started:
		time += delta


func reset() -> void:
	started = false
	time = 0
