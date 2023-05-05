class_name Player
extends CharacterBody2D


signal idled()
signal walked()
signal jumped()
signal fell()
signal used_rocket()
signal look_direction_changed(value: Vector2)

enum State {
	IDLE,
	WALK,
	JUMP,
	FALL,
	ROCKET,
}

@export var _horizontal_speed := 300.0
@export var _rocket_speed := 500.0
@export var _jump_velocity := -550.0
@export var _jump_interrupt_factor := 0.5
var look_direction := Vector2.RIGHT:
	get:
		return look_direction
	set(value):
		look_direction = value
		look_direction_changed.emit(look_direction)
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var spawn_position: Vector2
var state: State = State.IDLE:
	get:
		return state
	set(value):
		match value:
			State.IDLE:
				idled.emit()
			State.WALK:
				walked.emit()
			State.JUMP:
				jumped.emit()
			State.FALL:
				fell.emit()
			State.ROCKET:
				used_rocket.emit()
		state = value

@onready var _rocket_timer: Timer = %RocketTimer


func _ready() -> void:
	spawn_position = global_position


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action") and PlayerData.inventory.collectables > 0:
		_use_rocket()
	else:
		match state:
			State.IDLE, State.WALK:
				if event.is_action_pressed("jump"):
					velocity.y = _jump_velocity
					state = State.JUMP
			State.JUMP:
				if event.is_action_released("jump"):
					velocity.y *= _jump_interrupt_factor


func _physics_process(delta) -> void:
	match state:
		State.IDLE, State.WALK:
			_apply_horizontal_input()
			if !is_on_floor():
				state = State.FALL
		State.JUMP:
			_apply_horizontal_input()
			_apply_gravity(delta)
			if velocity.y > 0:
				state = State.FALL
		State.FALL:
			_apply_horizontal_input()
			_apply_gravity(delta)
			if is_on_floor():
				state = State.IDLE
	
	move_and_slide()


func respawn() -> void:
	global_position = spawn_position


func _apply_horizontal_input() -> void:
	var direction: float = InputUtility.get_axis_ceil("move_left", "move_right")
	velocity.x = direction * _horizontal_speed
	if direction:
		look_direction = Vector2(direction, 0)
		if state == State.IDLE:
			state = State.WALK
	elif state == State.WALK:
		state = State.IDLE


func _apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta


func _use_rocket() -> void:
	var direction: Vector2 = Vector2(
			InputUtility.get_axis_ceil("move_left", "move_right"),
			InputUtility.get_axis_ceil("move_up", "move_down")
	).normalized()
	if direction:
		look_direction = direction
		state = State.ROCKET
		PlayerData.inventory.collectables -= 1
		_rocket_timer.start()
		velocity = direction * _rocket_speed


func _on_rocket_timer_timeout() -> void:
	velocity.x = 0
	velocity.y = min(velocity.y, 0)
	state = State.IDLE if is_on_floor() else State.FALL


func _on_world_boundary_body_entered(body: Node2D) -> void:
	respawn()
