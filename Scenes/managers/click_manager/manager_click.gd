class_name ManagerClick
extends Node

static var ref: ManagerClick

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

func click() -> void:
	ManagerGold.ref.create_gold(1)
	pass
