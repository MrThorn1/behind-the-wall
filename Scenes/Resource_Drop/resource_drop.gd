extends Node2D

signal resource_drop_selected
var selected_for_raid : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	if CurrencySingleton.raid_menu_open:
		highlight_object()
		pass
	pass # Replace with function body.
	
func _on_area_2d_mouse_exited() -> void:
	unhighlight_object()
	pass # Replace with function body.
	
func highlight_object() -> void:
	$Sprite2D.modulate.g = 100
	pass

func unhighlight_object() -> void:
	if not selected_for_raid:
		$Sprite2D.modulate.g = 1

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if CurrencySingleton.raid_menu_open:
		print("raid menu open check passed")
		if event is InputEventMouseButton:
			print("mouse button event check passed")
			if event.button_index ==1:
				print("mouse button event passed correctly")
				if selected_for_raid:
					pass
				selected_for_raid = true
				emit_signal("resource_dropt_selected", self.name)
	pass # Replace with function body.
