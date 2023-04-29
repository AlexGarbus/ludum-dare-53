class_name Player
extends CharacterBody2D


@export var _horizontal_speed := 300.0
@export var _jump_velocity := -500.0
@export var _jump_interrupt_factor := 0.5
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta) -> void:
	if is_on_floor():
		if Input.is_action_just_pressed("move_up"):
			velocity.y = _jump_velocity
	else:
		if velocity.y < 0 and Input.is_action_just_released("move_up"):
			velocity.y *= _jump_interrupt_factor
		velocity.y += gravity * delta
	
	var direction = round(Input.get_axis("move_left", "move_right"))
	velocity.x = direction * _horizontal_speed

	move_and_slide()
