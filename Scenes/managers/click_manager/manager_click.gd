class_name ManagerClick
extends Node

static var ref: ManagerClick
var click_power : int = 0

signal click_power_updated

@onready var data : Data = Game.ref.data

func _ready() -> void:
	calculate_click_power()

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

func click() -> void:
	ManagerGold.ref.create_gold(click_power)
	pass

func calculate_click_power() -> void:
	var new_power : int = 1
	new_power += 1 * data.click_power_01_level
	new_power += 5 * data.click_power_02_level
	new_power *= (1 + data.click_multiplier_01_level)
	
	click_power = new_power
	click_power_updated.emit()
