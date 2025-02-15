class_name ManagerGold
extends Node

static var ref: ManagerGold

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal gold_created(quantity : int)

var gold : int = 0

func create_gold(quantity : int) -> void:
	gold += quantity
	gold_created.emit(quantity)
	pass
	
func get_gold() -> int:
	return gold
