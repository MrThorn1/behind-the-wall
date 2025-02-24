class_name BuildMenu
extends PanelContainer


@export var slot_scene : PackedScene
@onready var grid_container: GridContainer = %GridContainer
var resource_group:ResourceGroup = load("res://Resources/Base Resource & Groups/building_resource_group.tres")
var _content = [resource_group.load_all()]

func _ready():
	hide()

func open():
	show()
	for building in _content:
		var slot = slot_scene.instantiate()
		grid_container.add_child(slot)
		slot.display_building(building)
	

func _on_close_button_pressed() -> void:
	hide()
	pass # Replace with function body.

func _on_build_button_pressed() -> void:
	open()
	pass # Replace with function body.
