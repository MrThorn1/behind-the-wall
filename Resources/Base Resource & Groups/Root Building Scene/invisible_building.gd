extends Node2D

@export var building:Building
var time : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta) -> void:
	self.position = get_viewport().get_local_mouse_position()
	print(self.position)
	print("inprocess")
