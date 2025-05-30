class_name managersuspicion
extends Node

static var ref: managersuspicion

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal suspicion_modified(quantity : int)

var suspicion_value : int = 0

func modify_suspicion(quantity : int) -> void:
	CurrencySingleton.global_suspicion += quantity
	suspicion_modified.emit(quantity)
	pass
	
func get_suspicion() -> int:
	return CurrencySingleton.global_suspicion
