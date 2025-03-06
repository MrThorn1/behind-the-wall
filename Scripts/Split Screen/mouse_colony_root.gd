extends Node2D

var building:Building
@export var building_placement_holder:Building
var passed_name
var building_selected : bool = false
var resource_group:ResourceGroup = load("res://Resources/Base Resource & Groups/building_resource_group.tres")
#loading all of those resources, might have to autoload in the future
var _content = resource_group.load_all()
var invisible_building : Node2D

func _ready() -> void:
	get_viewport().size = Vector2(886,1066)
	pass # Replace with function body.

func _on_build_menu_passed_to_colony(passed_name) -> void:
	for building in _content:
		if building.name == passed_name:
			building_placement_holder = building
			invisible_building = building_placement_holder.scene.instantiate()
			add_child(invisible_building)
			#invisible_building.position = vector2(100,200)
			building_selected = true
			print(building_selected)
			print(invisible_building)
	pass # Replace with function body.

func _process(delta: float) -> void:
	if building_selected:
		invisible_building.position = get_local_mouse_position()
		pass
	pass
