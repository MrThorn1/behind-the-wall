extends Label

func _ready() -> void:
	update_text()
	managerfuel.ref.fuel_created.connect(_on_fuel_created)

func update_text() -> void:
	text = "%s" %managerfuel.ref.get_fuel()

func _on_fuel_created(_quantity : int) -> void:
	update_text()

func _on_fuel_button_pressed() -> void:
	pass # Replace with function body.
