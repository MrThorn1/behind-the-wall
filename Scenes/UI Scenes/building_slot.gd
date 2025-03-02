extends PanelContainer

@onready var texture_rect: TextureButton = %texture_button
@onready var food_cost_label: Label = %food_cost_label
@onready var cloth_cost_label: Label = %cloth_cost_label
@onready var wood_cost_label: Label = %wood_cost_label
@onready var trash_cost_label: Label = %trash_cost_label
@onready var building_name: Label = %Building_Name
@onready var metal_cost_label: Label = %metal_cost_label
@onready var elec_cost_label: Label = %elec_cost_label
@onready var fuel_cost_label: Label = %fuel_cost_label
signal build_button_pressed
var internal_name

func display(building:Building):
	self.name = building.name
	internal_name = self.name
	texture_rect.texture_normal = building.icon
	texture_rect.texture_hover = building.icon_hover
	building_name.text = building.name
	texture_rect.scale = Vector2(1.25,1.25)
	trash_cost_label.text = str(building.trash_cost)
	food_cost_label.text = str(building.food_cost)
	cloth_cost_label.text = str(building.cloth_cost)
	wood_cost_label.text = str(building.wood_cost)
	metal_cost_label.text = str(building.metal_cost)
	elec_cost_label.text = str(building.elec_cost)
	fuel_cost_label.text = str(building.fuel_cost)
	pass

func _on_mouse_entered() -> void:
	pass # Replace with function body.

func _on_mouse_exited() -> void:
	pass # Replace with function body.

func _on_texture_button_pressed():
	emit_signal("build_button_pressed")
	pass # Replace with function body.
