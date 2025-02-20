class_name managerelec
extends Node

static var ref: managerelec

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal elec_created(quantity : int)

var elec : int = 0

func create_elec(quantity : int) -> void:
	elec += quantity
	elec_created.emit(quantity)
	pass
	
func get_elec() -> int:
	return elec
