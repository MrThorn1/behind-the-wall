#This script is the trash manager that recieves the trash created signal
#from elswhere in the overall game scene.  This script recieves the signal
#from the click manager with the amount of trash to create, this updates the 
#quantity in the data file, and emits the signal for the lables to be updated
#in the ui_overlay

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
