extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var building:Building
var tweenscalechange : float = 1.5
var pivot_offset : float
var timer_wait_start : Timer = Timer.new()
var time_mod : float = randf_range(.25, .5)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("idle")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _timer_timeout() -> void:
	managerclick.ref.click(building.production_type,building.production_quantity)
	tweening()
	
func tweening() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(self, "scale", Vector2(tweenscalechange, tweenscalechange), 0.1)
	tween.tween_property(self, "scale", Vector2(1,1), 0.1)
