class_name managerfood
extends Node

static var ref: managerfood

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal food_created(quantity : int)

var food : int = 0

func create_food(quantity : int) -> void:
	CurrencySingleton.global_food += quantity
	food_created.emit(quantity)
	pass
	
func get_food() -> int:
	return CurrencySingleton.global_food
