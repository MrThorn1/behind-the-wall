extends Label

func _ready() -> void:
	update_text()
	managertrash.ref.trash_created.connect(_on_trash_created)

func update_text() -> void:
	text = "%s" %managertrash.ref.get_trash()

func _on_trash_created(_quantity : int) -> void:
	update_text()

func _on_trash_button_pressed() -> void:
	pass # Replace with function body.
