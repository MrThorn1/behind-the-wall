extends Label

func _ready() -> void:
	update_text()
	managerjunk.ref.junk_created.connect(_on_junk_created)

func update_text() -> void:
	text = "Junk : %s" %managerjunk.ref.get_junk()

func _on_junk_created(_quantity : int) -> void:
	update_text()
