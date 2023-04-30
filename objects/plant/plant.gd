class_name Plant
extends Area2D


signal pluck_time_shortened(value: float)

@export var _pluck_time_decrement := 0.5
var _max_pluck_time: float
var _overlapping_player := false

@onready var _collectable_anim: AnimationPlayer = %CollectableAnimation
@onready var _plant_anim: AnimationPlayer = %PlantAnimation
@onready var _pluck_timer: Timer = %PluckTimer


func _ready() -> void:
	_max_pluck_time = _pluck_timer.wait_time
	_collectable_anim.play("pluck")


func _unhandled_input(event: InputEvent) -> void:
	if (
			_overlapping_player and !_pluck_timer.is_stopped()
			and event.is_action_pressed("action")
	):
		_plant_anim.play("shake")
		_shorten_pluck_time()


func _shorten_pluck_time() -> void:
	var wait_time: float = _pluck_timer.wait_time - _pluck_time_decrement
	if wait_time <= 0:
		_pluck_timer.stop()
		_collectable_anim.play("pluck")
	else:
		_pluck_timer.wait_time = wait_time
		pluck_time_shortened.emit(wait_time)


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_overlapping_player = true


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		_overlapping_player = false


func _on_collectable_collected() -> void:
	_pluck_timer.start(_max_pluck_time)


func _on_pluck_timer_timeout() -> void:
	_collectable_anim.play("pluck")
