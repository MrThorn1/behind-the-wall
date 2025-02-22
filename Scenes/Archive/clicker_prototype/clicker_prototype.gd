class_name ClickerPrototype
extends Control

@export
var label : Label

var clicks : int = 0

func _on_button_pressed() -> void:
	ManagerClick.ref.click()
	pass # Replace with function body.
