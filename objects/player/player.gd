class_name Player
extends CharacterBody2D


@export var _horizontal_speed := 300.0
@export var _rocket_speed := 500.0
@export var _jump_velocity := -500.0
@export var _jump_interrupt_factor := 0.5
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var _using_rocket := false

@onready var _rocket_timer: Timer = %RocketTimer


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action") and PlayerData.inventory.collectables > 0:
		_use_rocket()
	elif !_using_rocket:
		if event.is_action_pressed("move_up") and is_on_floor():
			velocity.y = _jump_velocity
		elif event.is_action_released("move_up") and velocity.y < 0:
			velocity.y *= _jump_interrupt_factor


func _physics_process(delta) -> void:
	if !_using_rocket:
		if !is_on_floor():
			velocity.y += gravity * delta
	
		var direction: float = InputUtility.get_axis_ceil("move_left", "move_right")
		velocity.x = direction * _horizontal_speed

	move_and_slide()


func _use_rocket() -> void:
	var direction: Vector2 = Vector2(
			InputUtility.get_axis_ceil("move_left", "move_right"),
			InputUtility.get_axis_ceil("move_up", "move_down")
	).normalized()
	if direction:
		_using_rocket = true
		PlayerData.inventory.collectables -= 1
		_rocket_timer.start()
		velocity = direction * _rocket_speed


func _on_rocket_timer_timeout() -> void:
	_using_rocket = false
	velocity.x = 0
