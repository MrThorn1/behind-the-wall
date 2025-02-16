class_name managerclick
extends Node

static var ref: managerclick
var click_power : int = 1

@onready var data : Data = data_repository.ref.data

func _ready() -> void:
	pass

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

func click() -> void:
	managerjunk.ref.create_junk(click_power)
	pass
