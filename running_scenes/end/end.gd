class_name End
extends Node


@export var _end_dialogue: EndDialogue

@onready var _dialogue_label: Label = %Label

func _ready() -> void:
	_dialogue_label.text = _end_dialogue.get_text()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "end":
		get_tree().change_scene_to_file(ScenePaths.TITLE)
