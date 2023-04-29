extends Node


@onready var inventory: Inventory = %Inventory


func reset() -> void:
	inventory.collectables = 0
