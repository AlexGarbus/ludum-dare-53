class_name InputUtility
extends Object


static func is_event_valid(event: InputEvent) -> bool:
	return (
			event is InputEventKey 
			or event is InputEventJoypadButton 
			or event is InputEventJoypadMotion
	)


static func get_axis_ceil(negative_action: StringName, positive_action: StringName) -> float:
	var negative_strength: float = ceil(Input.get_action_strength(negative_action))
	var positive_strength: float = ceil(Input.get_action_strength(positive_action))
	return positive_strength - negative_strength
