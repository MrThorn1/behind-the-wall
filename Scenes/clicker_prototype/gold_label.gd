extends Label

func _ready() -> void:
	update_text()
	ManagerGold.ref.gold_created.connect(_on_gold_created)

func update_text() -> void:
	text = "Gold : %s" %ManagerGold.ref.get_gold()

func _on_gold_created(_quantity : int) -> void:
	update_text()
