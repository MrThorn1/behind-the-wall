extends CharacterBody2D


const speed = 300.0
const accel = 7
var distance_between
var target_position
var player_position
var markers_in_scene
var current_rotation
var rand_max : int = 100000
var rand_location_place : int
var rng = RandomNumberGenerator.new()
@export var room_target : Marker2D
@onready var nav:NavigationAgent2D = $NavigationAgent2D

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
	if distance_between < 4:
		self.position = target_position
	else:
		move_and_slide()
