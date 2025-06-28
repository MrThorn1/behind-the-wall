extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	print("area entered worked")
	if CurrencySingleton.raid_menu_open:
		highlight_object()
		pass
	pass # Replace with function body.
	
func _on_area_2d_mouse_exited() -> void:
	print("area excited worked")
	unhighlight_object()
	pass # Replace with function body.
	
func highlight_object() -> void:
	$Sprite2D.modulate.g = 500
	print("highlight activated")
	pass

func unhighlight_object() -> void:
	$Sprite2D.modulate.g = 1
	print("highlight deactiveate")
