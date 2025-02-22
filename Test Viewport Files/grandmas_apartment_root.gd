extends Node
var split_screen_location: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_viewport().size = Vector2(886,1066)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_split_screen_overlay_split_screen_switched(split_screen_location) -> void:
	pass # Replace with function body.
