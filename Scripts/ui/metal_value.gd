extends Label

func _ready() -> void:
	update_text()
	managermetal.ref.metal_created.connect(_on_metal_created)

func update_text() -> void:
	text = "%s" %managermetal.ref.get_metal()

func _on_metal_created(_quantity : int) -> void:
	update_text()

func _on_metal_button_pressed() -> void:
	pass # Replace with function body.
