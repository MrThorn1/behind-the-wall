extends Camera2D
@export var scroll_speed: int = 30
@export var scroll_distance: int = 540

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#split_screen_switched.connect()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_viewport().get_mouse_position().x > 0:
		if Input.is_action_just_released("scroll_up"):
			position.y -= scroll_speed
			if position.y <= -540:
				position.y = -540
		if Input.is_action_just_released("scroll_down"):
			position.y += scroll_speed
			if position.y >= 540:
				position.y = 540
