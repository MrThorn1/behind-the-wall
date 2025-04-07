class_name managercloth
extends Node

static var ref: managercloth

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal cloth_created(quantity : int)

var cloth : int = 0

func create_cloth(quantity : int) -> void:
	CurrencySingleton.global_cloth += quantity
	cloth_created.emit(quantity)
	pass
	
func get_cloth() -> int:
	return CurrencySingleton.global_cloth
