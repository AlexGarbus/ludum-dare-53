class_name Collectable
extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		queue_free()
