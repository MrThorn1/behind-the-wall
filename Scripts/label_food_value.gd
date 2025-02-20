extends Label

func _ready() -> void:
	update_text()
	managerfood.ref.food_created.connect(_on_food_created)

func update_text() -> void:
	text = "%s" %managerfood.ref.get_food()

func _on_food_created(_quantity : int) -> void:
	update_text()

func _on_food_button_pressed() -> void:
	pass # Replace with function body.
