class_name Game
extends Node

static var ref : Game

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

var data : Data = Data.new()
