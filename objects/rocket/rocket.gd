class_name Rocket
extends Node2D


const ROTATION_RIGHT: float = 0
const ROTATION_UP: float = PI / 2
const ROTATION_LEFT: float = PI
const ROTATION_DOWN: float = 3 * PI / 2

@export var gravity_factor: float = 0.01

var gravity: float = 0.0
var velocity := Vector2.ZERO


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	global_translate(velocity)


func rotate_towards_direction(direction: Vector2) -> void:
	if direction.x > 0:
		global_rotation = ROTATION_RIGHT
	elif direction.x < 0:
		global_rotation = ROTATION_LEFT
	elif direction.y > 0:
		global_rotation = ROTATION_DOWN
	elif direction.y < 0:
		global_rotation = ROTATION_UP


func stop_thrust() -> void:
	var stop_position: Vector2 = global_position
	top_level = true
	global_position = stop_position
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * gravity_factor


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
