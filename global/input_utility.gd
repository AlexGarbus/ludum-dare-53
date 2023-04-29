class_name InputUtility
extends Object


static func is_event_valid(event: InputEvent) -> bool:
	return (
			event is InputEventKey 
			or event is InputEventJoypadButton 
			or event is InputEventJoypadMotion
	)
