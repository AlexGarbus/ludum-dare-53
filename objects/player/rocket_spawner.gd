class_name RocketSpawner
extends Marker2D


@export var _rocket: PackedScene
var spawn_direction: Vector2
var _thrusting_rocket: Rocket


func _on_player_look_direction_changed(value: Vector2) -> void:
	spawn_direction = value


func _on_player_used_rocket() -> void:
	if _thrusting_rocket:
		_thrusting_rocket.stop_thrust()
	_thrusting_rocket = _rocket.instantiate() as Rocket
	add_child(_thrusting_rocket)
	_thrusting_rocket.rotate_towards_direction(spawn_direction)


func _on_rocket_timer_timeout() -> void:
	_thrusting_rocket.stop_thrust()
	_thrusting_rocket = null
