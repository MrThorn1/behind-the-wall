class_name managertrash
extends Node

static var ref: managertrash

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal trash_created(quantity : int)

var trash : int = 0

func create_trash(quantity : int) -> void:
	trash += quantity
	trash_created.emit(quantity)
	pass
	
func get_trash() -> int:
	return trash
