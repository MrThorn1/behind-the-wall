class_name managerjunk
extends Node

static var ref: managerjunk

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal junk_created(quantity : int)

var junk : int = 0

func create_junk(quantity : int) -> void:
	junk += quantity
	junk_created.emit(quantity)
	pass
	
func get_junk() -> int:
	return junk
