extends Node2D

@export var building:Building
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = building.scene.instantiate()
	add_child(instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
