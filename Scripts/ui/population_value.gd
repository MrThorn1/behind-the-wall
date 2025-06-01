extends Label

func _ready() -> void:
	update_text()
	managerpopulation.ref.population_created.connect(_on_population_created)

func update_text() -> void:
	text = "%s" %managerpopulation.ref.get_population()

func _on_population_created(_quantity : int) -> void:
	update_text()

func _on_population_button_pressed() -> void:
	pass # Replace with function body.
