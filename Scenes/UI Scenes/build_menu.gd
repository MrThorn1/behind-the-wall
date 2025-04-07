class_name BuildMenu
extends PanelContainer

#pulls the packed scene for the individual ui instance we created that generates single slot for each building icon
@export var slot_scene : PackedScene
@export var building_placement_holder:Building
#references with a scene unique name the grid container in th ebottom of the vbox container
@onready var grid_container: GridContainer = %GridContainer
#new resource group pulling everything from the building resources folder
var resource_group:ResourceGroup = load("res://Resources/Base Resource & Groups/building_resource_group.tres")
#loading all of those resources, might have to autoload in the future
var _content = resource_group.load_all()
signal passed_to_colony
var passed_name : String

func _ready():
	hide()

func open():
	#standrad UI command that shows it rather than hides it
	show()
	#loops through all of the buildings in the new resource array, and adds them to the new grid container slot for each one
	for building in _content:
		var slot = slot_scene.instantiate()
		grid_container.add_child(slot)
		slot.display(building)
		slot.build_button_pressed.connect(build_selected)
	get_tree().paused = true

func _on_close_button_pressed() -> void:
	hide()
	get_tree().paused = false
	for child in grid_container.get_children():
		child.queue_free()
	pass # Replace with function body.

func _on_build_button_pressed() -> void:
	open()
	pass # Replace with function body.
	
func build_selected(passed_name) -> void:
	emit_signal("passed_to_colony", passed_name)
	hide()
	for child in grid_container.get_children():
		child.queue_free()
	get_tree().paused = false
	pass
