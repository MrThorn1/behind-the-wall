extends Node2D

@export var building:Building
var tweenscalechange : float = 1.5
var pivot_offset : float
var timer_wait_start : Timer = Timer.new()
var time_mod : float = randf_range(.25, .5)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = building.scene.instantiate()
	add_child(instance)
	
	if building.production_time:
		var timer : Timer = Timer.new()
		add_child(timer)
		timer.start(building.production_time)
		timer.timeout.connect(_timer_timeout)

func tweening() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(self, "scale", Vector2(tweenscalechange, tweenscalechange), 0.1)
	tween.tween_property(self, "scale", Vector2(1,1), 0.1)

func _timer_timeout() -> void:
	managerclick.ref.click(building.production_type,building.production_quantity)
	tweening()
