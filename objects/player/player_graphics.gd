extends Node


@onready var _anim: AnimationPlayer = %AnimationPlayer
@onready var _sprite: Sprite2D = %Sprite2D


func _on_player_idled() -> void:
	_anim.play("player/idle")


func _on_player_walked() -> void:
	_anim.play("player/walk")


func _on_player_jumped() -> void:
	_anim.play("player/air")


func _on_player_fell() -> void:
	_anim.play("player/air")


func _on_player_used_rocket() -> void:
	_anim.play("player/air")


func _on_player_look_direction_changed(value: Vector2) -> void:
	if value.x > 0:
		_sprite.flip_h = false
	elif value.x < 0:
		_sprite.flip_h = true
