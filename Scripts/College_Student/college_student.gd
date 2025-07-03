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
@export var resource_drop : PackedScene
@export var room_target : Marker2D
@onready var nav:NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	resource_drop_time = randi_range(5,10)
	drop_timer()
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
		add_sibling.call_deferred(drop)
		drop.reparent($Drops)
		drop.name = "resource_drop " + str(drops_created)
		drops_created = drops_created + 1
	pass
	loops_iterated = loops_iterated + 1
	if loops_iterated == 10:
		resource_drop_time = randi_range(10,15)
		loops_iterated = 0
		
