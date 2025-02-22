class_name split_screen_overlay
extends CanvasLayer
var window_size = Vector2(0,0)
var mouse_position = Vector2()
var split_screen_separator: float
signal split_screen_switched(bool)
var split_screen_location: bool
var split_screen_location_previous: bool

static var ref: split_screen_overlay

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	split_screen_location = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if split_screen_location != split_screen_location_previous:
		split_screen_location_previous = split_screen_location
		split_screen_switched.emit(split_screen_location)
	window_size = get_viewport().size
	split_screen_separator = window_size.x/2
	mouse_position = get_viewport().get_mouse_position()
	if mouse_position.x >= split_screen_separator:
		split_screen_location = true
	if mouse_position.x < split_screen_separator:
		split_screen_location = false
	pass
