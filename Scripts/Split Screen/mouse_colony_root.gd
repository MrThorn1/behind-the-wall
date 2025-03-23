extends Node2D

var resource_group:ResourceGroup = load("res://Resources/Base Resource & Groups/building_resource_group.tres")
var _content = resource_group.load_all()
#loading all of those resources, might have to autoload in the future


var building:Building
var building_placement_holder
var building_placement_holder_2
var second_passed_name
var build_area_bottom_surface
var platform_size
var platform_position
var temp_name
var building_area_hovered_within

var building_selected : bool = false
var building_in_build_area : bool = false
var building_restricted : bool = false

var invisible_building : Node2D
var placed_building : Node2D
var tweenscalechange : float = 1.5
var pivot_offset : float
var timer_wait_start : Timer = Timer.new()
var time_mod : float = randf_range(.25, .5)
var production_update_time : int



func _ready() -> void:
	get_viewport().size = Vector2(886,1066)
	build_area_bottom_surface = $platform3.position.y
	#will need to be replaced with a signal input from the new collider function to pull the correct platform position upon entering
	pass # Replace with function body.

func _on_build_menu_passed_to_colony(passed_name) -> void:
	for building in _content:
		if building.building_name == passed_name:
			building_placement_holder = load("res://Resources/Base Resource & Groups/Root Building Scene/root_building.tscn").duplicate()
			invisible_building = building_placement_holder.instantiate()
			add_child(invisible_building)
			invisible_building.entered_a_restricted_area.connect(restrict_build)
			print("signal connected")
			invisible_building.name = "Temp_Invisible_Building"
			populate_invisible_building(building)
			$Temp_Invisible_Building.after_invisible_population()
			invisible_building.modulate.a = 0.5
			building_selected = true
			temp_name = building.building_name
	pass # Replace with function body.

func _process(delta: float) -> void:
	if building_restricted and building_selected:
		invisible_building.modulate.r = 100
	if Input.is_action_just_pressed("Cancel_Build") and building_selected:
		building_selected = false
		building_in_build_area = false
		invisible_building.queue_free()
	if building_in_build_area and building_selected:
		invisible_building.position.y = build_area_bottom_surface + ($platform3/platform_3_collider.shape.size.y/2)
		invisible_building.position.x = get_local_mouse_position().x
		if get_local_mouse_position().y < (invisible_building.position.y - 105):
			invisible_building.modulate.g = 1
			invisible_building.position.y = get_local_mouse_position().y
			pass
		if Input.is_action_just_pressed("Build_Building") and building_selected and not building_restricted:
			invisible_building.queue_free()
			for building in _content:
				if building.building_name == temp_name:
					building_placement_holder_2 = load("res://Resources/Base Resource & Groups/Root Building Scene/root_building.tscn").duplicate()
					placed_building = building_placement_holder_2.instantiate()
					add_child(placed_building)
					placed_building.name = "Temp_Placed_Building"
					populate_placed_building(building)
					placed_building.position.x = invisible_building.position.x
					placed_building.position.y = invisible_building.position.y
					building_selected = false
					building_in_build_area = false
	elif building_selected:
		if not building_in_build_area:
			invisible_building.position = get_local_mouse_position()
	pass

func _on_platform_3_area_entered(area: Area2D) -> void:
	if building_selected:
		building_area_hovered_within = area
		invisible_building.modulate.g = 200
		building_in_build_area = true
	pass # Replace with function body.
	
func _on_build_restrictor_area_entered(area: Area2D) -> void:
	print("signal connected")
	

func _on_platform_3_area_exited(area: Area2D) -> void:
	if building_selected:
		invisible_building.modulate.g = 1
		building_in_build_area = false
	pass # Replace with function body.
	
func populate_placed_building(building) -> void:
	$Temp_Placed_Building/Sprite2D.texture = building.building_sprite
	#placed_building.Sprite2D = building_placement_holder.building_sprite
	$Temp_Placed_Building.trash_cost = building.trash_cost
	$Temp_Placed_Building.food_cost = building.food_cost
	$Temp_Placed_Building.wood_cost = building.wood_cost
	$Temp_Placed_Building.metal_cost = building.metal_cost
	$Temp_Placed_Building.elec_cost = building.elec_cost
	$Temp_Placed_Building.fuel_cost = building.fuel_cost
	$Temp_Placed_Building.cloth_cost = building.cloth_cost
	$Temp_Placed_Building.production_type = building.production_type
	$Temp_Placed_Building.production_quantity = building.production_quantity
	$Temp_Placed_Building.production_time = building.production_time
	$Temp_Placed_Building.after_placed_population()
	$Temp_Placed_Building.name = building.building_name
	#placed_building.AnimatedSprite2D = building_placement_holder.building_sprite_sheet
	pass
	
func populate_invisible_building(building) -> void:
	$Temp_Invisible_Building/Sprite2D.texture = building.building_sprite
	#$RootBuilding.name = building.building_name
	#will need to instantiate and populate the buildingable collider here so that you can automatically create the buidling collider seperate from the buidlable area signal collider to generaete the size of the building to prepeve overwritting
	pass
pass

func restrict_build(area: Area2D) -> void:
	print("build restricted")
	building_restricted = true
	pass
