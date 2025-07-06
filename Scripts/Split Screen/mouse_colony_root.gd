extends Node2D

var resource_group:ResourceGroup = load("res://Resources/Building Resource & Groups/building_resource_group.tres")
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
var areas_on_restricted_list : Array
var current_platform

@export var building_suspicion_penalty : int = 2
var invisible_building : Node2D
var placed_building : Node2D
var tweenscalechange : float = 1.5
var pivot_offset : float
var timer_wait_start : Timer = Timer.new()
var time_mod : float = randf_range(.25, .5)
var production_update_time : int



func _ready() -> void:
	get_viewport().size = Vector2(886,1066)

	#will need to be replaced with a signal input from the new collider function to pull the correct platform position upon entering
	pass # Replace with function body.

func _on_build_menu_passed_to_colony(passed_name) -> void:
	for building in _content:
		if building.building_name == passed_name:
			building_placement_holder = load("res://Resources/Base Resource & Groups/Root Building Scene/root_building.tscn").duplicate()
			invisible_building = building_placement_holder.instantiate()
			add_child(invisible_building)
			invisible_building.name = "Temp_Invisible_Building"
			populate_invisible_building(building)
			$Temp_Invisible_Building.after_invisible_population()
			#$Temp_Invisible_Building/Build_Area_Selector.area_entered.connect(platform_build_enter)
			#$Temp_Invisible_Building/Build_Area_Selector.area_exited.connect(platform_build_exit)
			$Temp_Invisible_Building/Build_Restrictor.area_entered.connect(restrict_build)
			$Temp_Invisible_Building/Build_Restrictor.area_exited.connect(unrestrict_build)
			invisible_building.modulate.a = 0.5
			building_selected = true
			temp_name = building.building_name
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Cancel_Build") and building_selected:
		building_selected = false
		building_in_build_area = false
		invisible_building.queue_free()
		for building in _content:
			if building.building_name == temp_name:
				managerclick.ref.click(1,building.trash_cost)
				managerclick.ref.click(2,building.cloth_cost)
				managerclick.ref.click(3,building.food_cost)
				managerclick.ref.click(5,building.wood_cost)
				managerclick.ref.click(6,building.metal_cost)
				managerclick.ref.click(7,building.elec_cost)
				managerclick.ref.click(8,building.fuel_cost)
	if building_in_build_area and building_selected:
		if Input.is_action_just_pressed("Build_Building") and building_selected and not building_restricted:
			invisible_building.queue_free()
			managerclick.ref.click(4,building_suspicion_penalty)
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
				platform_position = building_area_hovered_within.position
		invisible_building.position.y = building_area_hovered_within.position.y + 40
		invisible_building.position.x = get_local_mouse_position().x
	elif building_selected:
		if not building_in_build_area:
			invisible_building.position = get_local_mouse_position()
			invisible_building.modulate.r = 1
			invisible_building.modulate.g = 1
	pass
	
func populate_placed_building(building) -> void:
	#$Temp_Placed_Building/Sprite2D.texture = building.building_sprite
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
	if $Temp_Placed_Building.production_type == 9:
		managerclick.ref.click(9,$Temp_Placed_Building.production_quantity)
	$Temp_Placed_Building.production_time = building.production_time
	$Temp_Placed_Building/AnimatedSprite2D.sprite_frames = building.building_animation_sheet
	$Temp_Placed_Building.after_placed_population()
	#$Temp_Place_Building/AnimatedSprite2D.play("idle")
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
	areas_on_restricted_list.append(area)
	building_restricted = true
	invisible_building.modulate.g = 1
	invisible_building.modulate.r = 500
	pass

func unrestrict_build(area: Area2D) -> void:
	areas_on_restricted_list.erase(area)
	if building_restricted and not areas_on_restricted_list:
		invisible_building.modulate.r = 1
		invisible_building.modulate.g = 500
		building_restricted = false
		
func _on_platform_1_mouse_entered() -> void:
	if building_selected:
		building_in_build_area = true
		building_area_hovered_within = $platform1
		if not building_restricted:
			invisible_building.modulate.g = 500
		if building_restricted:
			invisible_building.modulate.r = 500
	pass # Replace with function body.

func _on_platform_2_mouse_entered() -> void:
	if building_selected:
		building_in_build_area = true
		building_area_hovered_within = $platform2
		if not building_restricted:
			invisible_building.modulate.g = 500
		if building_restricted:
			invisible_building.modulate.r = 500
	pass # Replace with function body.

func _on_platform_3_mouse_entered() -> void:
	if building_selected:
		building_in_build_area = true
		building_area_hovered_within = $platform3
		if not building_restricted:
			invisible_building.modulate.g = 500
		if building_restricted:
			invisible_building.modulate.r = 500
	pass # Replace with function body.
	
func _on_platform_4_mouse_entered() -> void:
	if building_selected:
		building_in_build_area = true
		building_area_hovered_within = $platform4
		if not building_restricted:
			invisible_building.modulate.g = 500
		if building_restricted:
			invisible_building.modulate.r = 500
	pass # Replace with function body.
	
func _on_platform_5_mouse_entered() -> void:
	if building_selected:
		building_in_build_area = true
		building_area_hovered_within = $platform5
		if not building_restricted:
			invisible_building.modulate.g = 500
		if building_restricted:
			invisible_building.modulate.r = 500

func _on_platform_6_mouse_entered() -> void:
	if building_selected:
		building_in_build_area = true
		building_area_hovered_within = $platform6
		if not building_restricted:
				invisible_building.modulate.g = 500
		if building_restricted:
				invisible_building.modulate.r = 500
	pass # Replace with function body.

func _on_platform_7_mouse_entered() -> void:
	if building_selected:
		building_in_build_area = true
		building_area_hovered_within = $platform7
		if not building_restricted:
				invisible_building.modulate.g = 500
		if building_restricted:
				invisible_building.modulate.r = 500
	pass # Replace with function body.

func _on_platform_1_mouse_exited() -> void:
	mouse_building_left_area()
	pass # Replace with function body.
	
func _on_platform_2_mouse_exited() -> void:
	mouse_building_left_area()
	pass # Replace with function body.
	
func _on_platform_3_mouse_exited() -> void:
	mouse_building_left_area()
	pass # Replace with function body.

func _on_platform_4_mouse_exited() -> void:
	mouse_building_left_area()
	pass # Replace with function body.
	
func _on_platform_5_mouse_exited() -> void:
	mouse_building_left_area()
	pass # Replace with function bo

func _on_platform_6_mouse_exited() -> void:
	mouse_building_left_area()
	pass # Replace with function body.	

func _on_platform_7_mouse_exited() -> void:
	mouse_building_left_area()
	pass # Replace with function body.
	
func mouse_building_left_area() -> void:
	if building_selected:
		building_area_hovered_within = NAN
		building_in_build_area = false
	pass
