class_name RaidMenu
extends PanelContainer

var drop_for_menu_add
var drop_resource_group:ResourceGroup = load("res://Resources/Drop_Resource_&_Groups/drop_resource_group.tres")
var _content = drop_resource_group.load_all()

func _ready():
	hide()

func _on_raid_button_pressed() -> void:
	#standrad UI command that shows it rather than hides it
	get_tree().paused = true
	show()
	CurrencySingleton.raid_menu_open = true
	pass # Replace with function body.

func _on_close_button_pressed() -> void:
	hide()
	get_tree().paused = false
	CurrencySingleton.raid_menu_open = false
	pass # Replace with function body.


func _on_launch_raid_pressed() -> void:
	print("raid initated!!!")
	hide()
	get_tree().paused = false
	CurrencySingleton.raid_menu_open = false
	pass # Replace with function body.

func resource_drop_selected() -> void:
	print("signal connected")


func _on_students_apartment_resource_clicked_pass(passed_name) -> void:
	drop_for_menu_add = get_node(passed_name)
	print(drop_for_menu_add.trash_amount)
	pass # Replace with function body.
