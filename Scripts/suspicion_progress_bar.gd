extends TextureProgressBar

func _ready() -> void:
	update_value()
	managersuspicion.ref.suspicion_modified.connect(_on_suspicion_modified)

func update_value() -> void:
	value = managersuspicion.ref.get_suspicion()

func _on_suspicion_modified(_quantity : int) -> void:
	update_value()

func _on_trash_button_pressed() -> void:
	pass # Replace with function body.
