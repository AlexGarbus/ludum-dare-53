class_name Collectable
extends Area2D


signal collected()

@onready var _collision_shape: CollisionShape2D = %CollisionShape2D


func enable() -> void:
	visible = true
	_collision_shape.set_deferred("disabled", false)


func disable() -> void:
	visible = false
	_collision_shape.set_deferred("disabled", true)


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		collected.emit()
		disable()
