class_name Checkpoint
extends Area2D


@onready var _anim: AnimationPlayer = %AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_anim.play("checkpoint/active")
