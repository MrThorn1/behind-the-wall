class_name BuildMenu
extends PanelContainer

#pulls the packed scene for the individual ui instance we created that generates single slot for each building icon
@export var slot_scene : PackedScene
#references with a scene unique name the grid container in th ebottom of the vbox container
@onready var grid_container: GridContainer = %GridContainer
#new resource group pulling everything from the building resources folder
var resource_group:ResourceGroup = load("res://Resources/Base Resource & Groups/building_resource_group.tres")
#loading all of those resources, might have to autoload in the future
var _content = resource_group.load_all()

func _ready():
	hide()

func open():
	show()
	#loops through all of the buildings in the new resource array, and adds them to the new grid container slot for each one
	for child in grid_container.get_children():
		child.queue_free()
	
	for building in _content:
		var slot = slot_scene.instantiate()
		grid_container.add_child(slot)
		slot.display(building)

func _on_close_button_pressed() -> void:
	hide()
	pass # Replace with function body.

func _on_build_button_pressed() -> void:
	open()
	pass # Replace with function body.
