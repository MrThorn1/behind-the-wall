class_name managerfuel
extends Node

static var ref: managerfuel

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal fuel_created(quantity : int)

var fuel : int = 0

func create_fuel(quantity : int) -> void:
	fuel += quantity
	fuel_created.emit(quantity)
	pass
	
func get_fuel() -> int:
	return fuel
