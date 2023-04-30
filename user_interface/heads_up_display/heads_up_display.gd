class_name HeadsUpDisplay
extends Control


const COLLECTABLES_LABEL_TEXT := "x%s"
const TIME_LABEL_TEXT := "%s sec."

@onready var _collectables_label := %CollectablesLabel
@onready var _time_label := %GameTimeLabel


func _ready() -> void:
	PlayerData.inventory.collectables_changed.connect(_on_collectables_changed)
	PlayerData.game_stopwatch.time_changed.connect(_on_time_changed)


func _on_collectables_changed(value: int) -> void:
	_collectables_label.text = COLLECTABLES_LABEL_TEXT % str(value)


func _on_time_changed(value: float) -> void:
	_time_label.text = TIME_LABEL_TEXT % str(round(value))
