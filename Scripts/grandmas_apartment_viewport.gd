class_name grandmas_apartment_viewport
extends SubViewport

static var ref: grandmas_apartment_viewport

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self
# Called when the node enters the scene tree for the first time.
