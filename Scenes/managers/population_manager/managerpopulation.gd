class_name managerpopulation
extends Node

static var ref: managerpopulation

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

signal population_created(quantity : int)

var population : int = 0

func create_population(quantity : int) -> void:
	CurrencySingleton.global_population += quantity
	population_created.emit(quantity)
	pass
	
func get_population() -> int:
	return CurrencySingleton.global_population


func _on_population_button_pressed() -> void:
	pass # Replace with function body.
