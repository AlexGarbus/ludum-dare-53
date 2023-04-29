class_name Plant
extends Area2D


@export var _pluck_time_decrement := 0.5
var _max_pluck_time: float
var _overlapping_player := false

@onready var _anim: AnimationPlayer = %AnimationPlayer
@onready var _pluck_timer: Timer = %PluckTimer


func _ready() -> void:
	_max_pluck_time = _pluck_timer.wait_time
	_anim.play("plant/pluck")


func _unhandled_input(event: InputEvent) -> void:
	if (
			_overlapping_player and !_pluck_timer.is_stopped()
			and event.is_action_pressed("action")
	):
		_shorten_pluck_time()


func _shorten_pluck_time() -> void:
	var wait_time: float = _pluck_timer.wait_time - _pluck_time_decrement
	if wait_time <= 0:
		_pluck_timer.stop()
		_anim.play("plant/pluck")
	else:
		_pluck_timer.wait_time = wait_time


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_overlapping_player = true


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		_overlapping_player = false


func _on_collectable_collected() -> void:
	_pluck_timer.start(_max_pluck_time)


func _on_pluck_timer_timeout() -> void:
	_anim.play("plant/pluck")
