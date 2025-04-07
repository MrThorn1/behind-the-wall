class_name managerwood
extends Node

static var ref: managerwood

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal wood_created(quantity : int)

var wood : int = 0

func create_wood(quantity : int) -> void:
	CurrencySingleton.global_wood += quantity
	wood_created.emit(quantity)
	pass
	
func get_wood() -> int:
	return CurrencySingleton.global_wood
