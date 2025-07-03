class_name Resource_Drop
extends Node2D

signal resource_drop_selected(resource_name)
var selected_for_raid : bool = false
var is_resource : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.add_to_group("drops")
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
		if event is InputEventMouseButton:
			if event.button_index ==1:
				if not selected_for_raid:
					selected_for_raid = true
					emit_signal("resource_drop_selected", self.name)
				if selected_for_raid:
					pass
	pass # Replace with function body.
