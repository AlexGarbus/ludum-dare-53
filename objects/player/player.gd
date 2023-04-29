class_name Player
extends CharacterBody2D


@export var _speed := 300.0
@export var _jump_velocity = -500.0

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = _jump_velocity

	var direction = round(Input.get_axis("move_left", "move_right"))
	if direction:
		velocity.x = direction * _speed
	else:
		velocity.x = move_toward(velocity.x, 0, _speed)

	move_and_slide()
