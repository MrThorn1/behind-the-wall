extends Label

func _ready() -> void:
	update_text()
	managerwood.ref.wood_created.connect(_on_wood_created)

func update_text() -> void:
	text = "%s" %managerwood.ref.get_wood()

func _on_wood_created(_quantity : int) -> void:
	update_text()

func _on_wood_button_pressed() -> void:
	pass # Replace with function body.
