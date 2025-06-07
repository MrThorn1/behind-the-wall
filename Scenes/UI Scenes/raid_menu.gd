class_name RaidMenu
extends Control

func _ready():
	hide()

func _on_raid_button_pressed() -> void:
	#standrad UI command that shows it rather than hides it
	get_tree().paused = true
	show()
	pass # Replace with function body.

func _on_close_button_pressed() -> void:
	print("closed button pressed confirm")
	hide()
	get_tree().paused = false
	pass # Replace with function body.
