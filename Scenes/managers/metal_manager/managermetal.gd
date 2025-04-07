class_name managermetal
extends Node

static var ref: managermetal

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal metal_created(quantity : int)

var metal : int = 0

func create_metal(quantity : int) -> void:
	CurrencySingleton.global_metal += quantity
	metal_created.emit(quantity)
	pass
	
func get_metal() -> int:
	return CurrencySingleton.global_metal
