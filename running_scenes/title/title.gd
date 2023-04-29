class_name Title
extends Node


var _input_received := false

@onready var _menu := %Menu;
@onready var _dialogue := %Dialogue
@onready var _start_timer := %StartTimer


func _ready() -> void:
	_menu.visible = true
	_dialogue.visible = false


func _input(event: InputEvent) -> void:
	if !_input_received and InputUtility.is_event_valid(event):
		_input_received = true
		_start_game()


func _start_game() -> void:
	_menu.visible = false
	_dialogue.visible = true
	_start_timer.start()

func _on_start_timer_timeout() -> void:
	get_tree().change_scene_to_file(ScenePaths.GAME)
