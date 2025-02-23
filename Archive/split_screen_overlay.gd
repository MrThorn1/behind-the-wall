class_name split_screen_overlay
extends CanvasLayer

static var ref: split_screen_overlay

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
