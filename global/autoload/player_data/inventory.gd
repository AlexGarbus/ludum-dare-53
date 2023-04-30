class_name Inventory
extends Node


signal collectables_changed(value: int)

var collectables := 0:
	get:
		return collectables
	set(value):
		collectables = max(value, 0)
		collectables_changed.emit(collectables)
