extends Label

func _ready() -> void:
	update_text()
	managerelec.ref.elec_created.connect(_on_elec_created)

func update_text() -> void:
	text = "%s" %managerelec.ref.get_elec()

func _on_elec_created(_quantity : int) -> void:
	update_text()

func _on_elec_button_pressed() -> void:
	pass # Replace with function body.
