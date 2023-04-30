class_name Rocket
extends Node2D


signal enabled()
signal disabled()

const ROTATION_RIGHT: float = 0
const ROTATION_UP: float = PI / 2
const ROTATION_LEFT: float = PI
const ROTATION_DOWN: float = 3 * PI / 2

@onready var _particles: GPUParticles2D = %GPUParticles2D
@onready var _sprite: Sprite2D = %Sprite2D


func _ready() -> void:
	_sprite.visible = false


func enable() -> void:
	_sprite.visible = true
	_particles.emitting = true
	enabled.emit()


func disable() -> void:
	_sprite.visible = false
	_particles.emitting = false
	disabled.emit()


func rotate_towards_direction(direction: Vector2) -> void:
	if direction.x > 0:
		global_rotation = ROTATION_RIGHT
	elif direction.x < 0:
		global_rotation = ROTATION_LEFT
	elif direction.y > 0:
		global_rotation = ROTATION_DOWN
	elif direction.y < 0:
		global_rotation = ROTATION_UP


func _on_player_used_rocket(direction: Vector2) -> void:
	enable()
	rotate_towards_direction(direction)


func _on_rocket_timer_timeout() -> void:
	disable()
