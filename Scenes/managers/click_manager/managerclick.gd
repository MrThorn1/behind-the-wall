#This script is the main input manager for the game scene.  
#Each of the individaul resource managers is reference linked to this 
#script so when a button or action generates resources it comes there 
#here with the two input variable types.
class_name managerclick
extends Node

static var ref: managerclick
var resource_type : int
# setting up the resource click type so that we can differentiate 
#between what of click we get so that it can be allocated to the 
#correct resource type
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

func click(resource_type, quantity) -> void:
	if resource_type == 1:
		managertrash.ref.create_trash(quantity)
	if resource_type == 2:
		managercloth.ref.create_cloth(quantity)
	if resource_type == 3:
		managerfood.ref.create_food(quantity)
	if resource_type == 4:
		managersuspicion.ref.modify_suspicion(quantity)
	if resource_type == 5:
		managerwood.ref.create_wood(quantity)
	if resource_type == 6:
		managermetal.ref.create_metal(quantity)
	if resource_type == 7:
		managerelec.ref.create_elec(quantity)
	if resource_type == 8:
		managerfuel.ref.create_fuel(quantity)
	pass
