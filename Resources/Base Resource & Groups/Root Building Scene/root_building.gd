extends Node2D

var tweenscalechange : float = 1.5
var pivot_offset : float
var building_sprite
var trash_cost : int
var food_cost
var wood_cost
var metal_cost
var elec_cost
var fuel_cost
var cloth_cost
var production_type
var production_quantity
var production_time
var sprite_size
var sprite_size_x
var sprite_size_y
var sprite_holder
signal entered_a_restricted_area

func tweening() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(self, "scale", Vector2(tweenscalechange, tweenscalechange), 0.1)
	tween.tween_property(self, "scale", Vector2(1,1), 0.1)

func _timer_timeout() -> void:
	managerclick.ref.click(production_type,production_quantity)
	tweening()
	
func reset_size_and_texture() -> void:
	pass
	
func after_placed_population() -> void:
	if production_time:
		var timer : Timer = Timer.new()
		add_child(timer)
		timer.start(production_time)
		timer.timeout.connect(_timer_timeout)
	sprite_holder = get_child(0)
	sprite_size = sprite_holder.texture.get_size()
	sprite_holder.offset = Vector2(0, -(sprite_size.y/2))
	pass
	
func after_invisible_population() -> void:
	sprite_holder = get_child(0)
	sprite_size = sprite_holder.texture.get_size()
	sprite_holder.offset = Vector2(0, -(sprite_size.y/2))
	$Build_Restrictor/Build_Restrictor_Collider.shape.size.x = sprite_size.x
	$Build_Restrictor/Build_Restrictor_Collider.shape.size.y = sprite_size.y
	

func _on_build_restrictor_area_entered(area: Area2D) -> void:
	emit_signal("entered_a_restricted_area")
	pass # Replace with function body.
