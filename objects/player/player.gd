class_name Player
extends CharacterBody2D


@export var _horizontal_speed := 300.0
@export var _jump_velocity := -500.0
@export var _jump_interrupt_factor := 0.5
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _unhandled_input(event: InputEvent) -> void:
	if is_on_floor() and event.is_action_pressed("move_up"):
		velocity.y = _jump_velocity
	elif velocity.y < 0 and event.is_action_pressed("move_up"):
		velocity.y *= _jump_interrupt_factor


func _physics_process(delta) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta
	
	var direction = InputUtility.get_axis_ceil("move_left", "move_right")
	velocity.x = direction * _horizontal_speed

	move_and_slide()
