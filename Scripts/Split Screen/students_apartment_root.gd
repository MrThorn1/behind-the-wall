extends Node

var monday_schedule = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
var tuesday_schedule = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
var wednesday_schedule = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
var thursday_schedule = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
var friday_schedule = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
var saturday_schedule = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
var sunday_schedule = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
var possible_positions = []
var possible_free_time_positions = [0,1,2,3,4,6,7]
var class_schedule_1 = [6,7,11,12,16,17]
var class_schedule_2 = [6,7,8,9,10]
var class_schedule_3 = [13,14,15,16,17]
var class_schedule_4 = [8,9,10,13,14,15]
var class_selected
var actual_class_array
var class_schedules = [class_schedule_1,class_schedule_2,class_schedule_3,class_schedule_4]
var current_week
var current_time
var rng = RandomNumberGenerator.new()
signal resource_clicked_pass
var resource_clicked_pass_name
var drop_resource_group:ResourceGroup = load("res://Resources/Drop_Resource_&_Groups/drop_resource_group.tres")
var _content = drop_resource_group.load_all()

func _ready() -> void:
	generate_week()
	current_time = 0
	current_week = monday_schedule
	assign_location()
	get_viewport().size = Vector2(886,1066)
	pass # Replace with function body.

func generate_week() -> void:
	generate_weekday()
	generate_weekend()
	pass
	
func generate_weekday() -> void:
	#select class schedule for the week
	class_selected =  randi_range(0,3)
	actual_class_array = class_schedules[class_selected]
	for i in 24:
		if i==0 or i==1 or i==2 or i==3 or i==4 or i==5 or i==22 or i==23:
#generate the sleep schedule 
			monday_schedule[i] = 5
			tuesday_schedule[i] = 5
			wednesday_schedule[i] = 5
			thursday_schedule[i] = 5
			friday_schedule[i] = 5
#adding the randomly selected class schedule to the weekly 
		for index in actual_class_array:
			if index == i:
				monday_schedule[i] = 7
				tuesday_schedule[i] = 7
				wednesday_schedule[i] = 7
				thursday_schedule[i] = 7
				friday_schedule[i] = 7
		pass
		if monday_schedule[i] == 10:
			monday_schedule[i] = possible_free_time_positions[randi_range(0,6)]
		if tuesday_schedule[i] == 10:
			tuesday_schedule[i] = possible_free_time_positions[randi_range(0,6)]
		if wednesday_schedule[i] == 10:
			wednesday_schedule[i] = possible_free_time_positions[randi_range(0,6)]
		if thursday_schedule[i] == 10:
			thursday_schedule[i] = possible_free_time_positions[randi_range(0,6)]
		if friday_schedule[i] == 10:
			friday_schedule[i] = possible_free_time_positions[randi_range(0,6)]
	pass

func generate_weekend() -> void:
	for i in 24:
		if i==0 or i==1 or i==2 or i==3 or i==4 or i==5 or i==22 or i==23:
#generate the sleep schedule 
			saturday_schedule[i] = 5
			sunday_schedule[i] = 5
	pass

func assign_location() -> void:
	var locations = get_node("Position_Markers")
	for j in locations.get_children():
		possible_positions.append(j.get_position())
	pass
	$College_Student.target_position = possible_positions[current_week[current_time]]

func _on_timer_timeout() -> void:
	advance_to_next_hour()
	pass # Replace with function body.

func advance_to_next_hour() -> void:
	current_time = current_time +1
	if current_week == monday_schedule and current_time == 24:
		current_week = tuesday_schedule
		current_time = 0
	if current_week == tuesday_schedule and current_time == 24:
		current_week = wednesday_schedule
		current_time = 0
	if current_week == wednesday_schedule and current_time == 24:
		current_week = thursday_schedule
		current_time = 0
	if current_week == thursday_schedule and current_time == 24:
		current_week = friday_schedule
		current_time = 0
	if current_week == friday_schedule and current_time == 24:
		current_week = saturday_schedule
		current_time = 0
	if current_week == saturday_schedule and current_time == 24:
		current_week = sunday_schedule
		current_time = 0
	if current_week == sunday_schedule and current_time == 24:
		generate_week()
		current_week = monday_schedule
		current_time = 0
	assign_location()
	pass

func _on_child_entered_tree(node: Node) -> void:
	if node.is_in_group("drops"):
		node.resource_drop_selected.connect(pass_drop_selected_signal_to_raid_menu)
		var resource_selected : String
		pass
	#use this to connect the individaul signal from each resource node when it is dropped so that it can be clicked to notify the raid menu
	pass # Replace with function body.
	
func pass_drop_selected_signal_to_raid_menu(resource_selected) -> void:

	emit_signal("resource_clicked_pass", resource_selected)
	pass
