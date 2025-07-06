extends CharacterBody2D


const speed = 300.0
const accel = 7
var distance_between
var target_position
var player_position
var markers_in_scene
var current_rotation
var moving : bool = false
var rand_max : int = 100000
var rand_location_place : int
var rng = RandomNumberGenerator.new()
var resource_drop_time : int
var drops_created : int = 0
var available_resources_to_drop_quantity
var resource_number_dropped
var resource_type_dropped
var temp_sprite
@export var resource_drop : PackedScene
@export var room_target : Marker2D
@onready var nav:NavigationAgent2D = $NavigationAgent2D
var drop_resource_group:ResourceGroup = load("res://Resources/Drop_Resource_&_Groups/drop_resource_group.tres")
var _content = drop_resource_group.load_all()

func _ready() -> void:
	resource_drop_time = randi_range(1,2)
	drop_timer()
	available_resources_to_drop_quantity = _content.size()
	#set_custom_viewport(Vector2(886,1066))
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	player_position = self.get_position()
	distance_between = player_position.distance_to(target_position)
	var direction = Vector3()
	nav.target_position = target_position
	
	direction = nav.get_next_path_position() - global_position
	current_rotation = rad_to_deg((direction.angle()))
	direction = direction.normalized()
	set_rotation_degrees(current_rotation+180)
	velocity = velocity.lerp(direction*speed, accel * delta)
	if velocity.length() > 0.25:
		moving = true
	else:
		moving = false
	if distance_between < 4:
		self.position = target_position
	else:
		move_and_slide()

func drop_timer():
	var timer : Timer = Timer.new()
	add_child(timer)
	timer.start(resource_drop_time)
	timer.timeout.connect(_timer_timeout)

func _timer_timeout():
	var loops_iterated = 0
	if moving and self.position.x > 0:
		var drop = resource_drop.instantiate()
		drop.global_position = self.global_position
		resource_number_dropped = randi_range(0,available_resources_to_drop_quantity - 1)
		print(available_resources_to_drop_quantity)
		add_sibling.call_deferred(drop)
		drop.add_to_group("drops")
		resource_type_dropped = _content[resource_number_dropped]
		temp_sprite = drop.get_child(1)
		temp_sprite = resource_type_dropped.drop_sprite
		drop.name = "resource_drop " + str(drops_created)
		drops_created = drops_created + 1
	pass
	loops_iterated = loops_iterated + 1
	if loops_iterated == 10:
		resource_drop_time = randi_range(10,15)
		loops_iterated = 0
		
