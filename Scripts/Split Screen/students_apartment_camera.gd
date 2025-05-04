extends Camera2D
@export var scroll_speed: int = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#set_custom_viewport(Vector2(886,1066))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_viewport().get_mouse_position().x < get_viewport().size.x:
		if Input.is_action_just_released("scroll_up"):
			position.y -= scroll_speed
			if position.y <= -540:
				position.y = -540
		if Input.is_action_just_released("scroll_down"):
			position.y += scroll_speed
			if position.y >= 540:
				position.y = 540
