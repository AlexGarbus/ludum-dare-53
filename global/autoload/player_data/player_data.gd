extends Node


@onready var inventory: Inventory = %Inventory
@onready var game_stopwatch: Stopwatch = %GameStopwatch


func reset() -> void:
	inventory.collectables = 0
	game_stopwatch.reset()
