extends Node2D

var building:Building
var building_placement_holder:Building
var passed_name
var second_passed_name
var building_selected : bool = false
var building_in_build_area : bool = false
var build_area_bottom_surface
var resource_group:ResourceGroup = load("res://Resources/Base Resource & Groups/building_resource_group.tres")
#loading all of those resources, might have to autoload in the future
var _content = resource_group.load_all()
var invisible_building : Node2D
var placed_building : Node2D
var platform_size
var platform_position
var tweenscalechange : float = 1.5
var pivot_offset : float
var timer_wait_start : Timer = Timer.new()
var time_mod : float = randf_range(.25, .5)
var production_update_time : int

func _ready() -> void:
	get_viewport().size = Vector2(886,1066)
	build_area_bottom_surface = $platform3.position.y
	pass # Replace with function body.

func _on_build_menu_passed_to_colony(passed_name) -> void:
	for building in _content:
		if building.name == passed_name:
			building_placement_holder = building
			invisible_building = building_placement_holder.scene.instantiate()
			add_child(invisible_building)
			print(invisible_building)
			invisible_building.modulate.a = 0.5
			building_selected = true
	pass # Replace with function body.

func _process(delta: float) -> void:
	if building_in_build_area and building_selected:
		invisible_building.position.y = build_area_bottom_surface + ($platform3/platform_3_collider.shape.size.y/2)
		invisible_building.position.x = get_local_mouse_position().x
		if Input.is_action_just_pressed("Build_Building") and building_selected:
			placed_building = building_placement_holder.scene.instantiate()
			add_child(placed_building)
			placed_building.position.x = invisible_building.position.x
			placed_building.position.y = invisible_building.position.y
			building_selected = false
	elif building_selected:
		if not building_in_build_area:
			invisible_building.position = get_local_mouse_position()
	pass

func building_enetered_build_area() -> void: 
	if building_selected:
		pass
	pass # Replace with function body.

func _on_platform_3_area_entered(area: Area2D) -> void:
	invisible_building.modulate.g = 200
	building_in_build_area = true
	pass # Replace with function body.

func _on_platform_3_area_exited(area: Area2D) -> void:
	invisible_building.modulate.g = 1
	building_in_build_area = false
	pass # Replace with function body.
