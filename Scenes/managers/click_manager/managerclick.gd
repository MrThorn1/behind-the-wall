class_name managerclick
extends Node

static var ref: managerclick
var resource_type : int
# setting up the resource click type so that we can differentiate between what of click we get so that it can be allocated to the correct resource type
var click_power : int = 1
var quantity : int = 1

@onready var data : Data = data_repository.ref.data

func _ready() -> void:
	pass

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
		
	ref = self

func click(resource_type) -> void:
	if resource_type == 1:
		managertrash.ref.create_trash(quantity)
	if resource_type == 2:
		managercloth.ref.create_cloth(quantity)
		pass
