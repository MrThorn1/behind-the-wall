extends Node2D

var tweenscalechange : float = 1.5
var pivot_offset : float
var timer_wait_start : Timer = Timer.new()
var time_mod : float = randf_range(.25, .5)
var trash_cost
var food_cost
var wood_cost
var metal_cost
var elec_cost
var fuel_cost
var cloth_cost
var production_type
var production_quantity
var production_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if production_time:
		var timer : Timer = Timer.new()
		add_child(timer)
		timer.start(production_time)
		timer.timeout.connect(_timer_timeout)

func tweening() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(self, "scale", Vector2(tweenscalechange, tweenscalechange), 0.1)
	tween.tween_property(self, "scale", Vector2(1,1), 0.1)

func _timer_timeout() -> void:
	managerclick.ref.click(production_type,production_quantity)
	tweening()
