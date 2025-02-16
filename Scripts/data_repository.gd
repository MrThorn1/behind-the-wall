class_name data_repository
extends Node

static var ref : data_repository

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

var data : Data = Data.new()
