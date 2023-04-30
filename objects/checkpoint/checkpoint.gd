class_name Checkpoint
extends Area2D


var active := false

@onready var _anim: AnimationPlayer = %AnimationPlayer
@onready var _player_offset: Marker2D = %PlayerOffset


func _on_body_entered(body: Node2D) -> void:
	if active:
		return
	
	var player := body as Player
	if player:
		_anim.play("checkpoint/active")
		player.spawn_position = _player_offset.global_position
		active = true
