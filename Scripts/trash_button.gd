extends Button

var tweenscalechange : float = 1.1

func _ready() -> void:
	reposition_pivot_offset()

func reposition_pivot_offset() -> void:
	pivot_offset = size / 2.0

func tweening() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(self, "scale", Vector2(tweenscalechange, tweenscalechange), 0.05)
	tween.tween_property(self, "scale", Vector2(1,1), 0.05)

func _on_pressed() -> void:
	managerclick.ref.click(1,1)
	tweening()
	pass # Replace with function body.
