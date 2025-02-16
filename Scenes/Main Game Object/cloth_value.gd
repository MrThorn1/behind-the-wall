extends Label

func _ready() -> void:
	update_text()
	managercloth.ref.cloth_created.connect(_on_cloth_created)

func update_text() -> void:
	text = "%s" %managercloth.ref.get_cloth()

func _on_cloth_created(_quantity : int) -> void:
	update_text()

func _on_cloth_button_pressed() -> void:
	pass # Replace with function body.
