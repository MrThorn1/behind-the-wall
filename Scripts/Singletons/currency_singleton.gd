extends Node

var global_trash : int
var global_cloth : int
var global_food : int
var global_wood : int
var global_metal : int
var global_elec : int
var global_fuel : int
var global_suspicion : int
var global_population : int
var global_research : int
var full_building_list
var raid_menu_open : bool

func _ready():
	var resource_group:ResourceGroup = load("res://Resources/Building Resource & Groups/building_resource_group.tres")
	var full_building_list = resource_group.load_all()
#loading all of those resources, might have to autoload in the future
