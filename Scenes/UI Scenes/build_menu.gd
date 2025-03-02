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
var instantiated_tree : SceneTree
var vbox_child : Node
var margin_child : Node
var grid_child : Node
var panel_child : Node
var texture_button_child : Node
var instantiated_path : String

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
		#some_node_with_signal.pressed.connect(bullet_node.some_func)
		slot.build_button_pressed.connect(build_select)
	
	get_tree().paused = true

func _on_close_button_pressed() -> void:
	hide()
	get_tree().paused = false
	pass # Replace with function body.

func _on_build_button_pressed() -> void:
	open()
	pass # Replace with function body.
	
func build_select() -> void:
	print("building signal passed to build menu")
	pass
