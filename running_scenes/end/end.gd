class_name End
extends Node


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "end":
		get_tree().change_scene_to_file(ScenePaths.TITLE)
