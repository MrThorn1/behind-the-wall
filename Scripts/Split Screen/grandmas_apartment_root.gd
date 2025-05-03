extends Node

var monday_schedule = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
var tuesday_schedule = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
var wednesday_schedule = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
var thursday_schedule = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
var friday_schedule = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
var saturday_schedule = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
var sunday_schedule = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
var possible_positions = []
var class_schedule_1 = [6,7,11,12,16,17]
var class_schedule_2 = [6,7,8,9,10]
var class_schedule_3 = [13,14,15,16,17]
var class_schedule_4 = [8,9,10,13,14,15]
var class_schedules = [class_schedule_1,class_schedule_2,class_schedule_3,class_schedule_4]
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	generate_locations()
	generate_week()
	get_viewport().size = Vector2(886,1066)
	pass # Replace with function body.

func generate_week() -> void:
	generate_weekday()
	generate_weekend()
	pass
	
func generate_weekday() -> void:
	#generate the sleep schedule 
	#monday_schedule[0] = possible_positions[5]
	#monday_schedule[1] = possible_positions[5]
	#monday_schedule[2] = possible_positions[5]
	#monday_schedule[3] = possible_positions[5]
	#monday_schedule[4] = possible_positions[5]
	#monday_schedule[5] = possible_positions[5]
	#monday_schedule[22] = possible_positions[5]
	#monday_schedule[23] = possible_positions[5]
	for i in 24:
		if i==0 or i==1 or i==2 or i==3 or i==4 or i==5 or i==22 or i==23:
			monday_schedule[i] = possible_positions[5]
			tuesday_schedule[i] = possible_positions[5]
			wednesday_schedule[i] = possible_positions[5]
			thursday_schedule[i] = possible_positions[5]
			friday_schedule[i] = possible_positions[5]
			pass
		for k in [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]:
			pass
		pass
	pass

func generate_weekend() -> void:
	pass

func generate_locations() -> void:
	var locations = get_node("Position_Markers")
	for j in locations.get_children():
		possible_positions.append(j.get_position())
	pass
	
