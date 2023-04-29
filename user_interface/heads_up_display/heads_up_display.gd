class_name HeadsUpDisplay
extends Control


const COLLECTABLES_COUNT_TEXT := "x%s"

@onready var _collectables_count := %CollectablesCount


func _ready() -> void:
	PlayerData.inventory.collectables_changed.connect(_on_collectables_changed)


func _on_collectables_changed(value: int) -> void:
	_collectables_count.text = COLLECTABLES_COUNT_TEXT % str(value)
