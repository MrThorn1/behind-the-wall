extends PanelContainer

@onready var texture_rect: TextureButton = %texture_button
@onready var food_cost_label: Label = %food_cost_label
@onready var cloth_cost_label: Label = %cloth_cost_label
@onready var wood_cost_label: Label = %wood_cost_label
@onready var trash_cost_label: Label = %trash_cost_label
@onready var building_name_label: Label = %Building_Name
@onready var metal_cost_label: Label = %metal_cost_label
@onready var elec_cost_label: Label = %elec_cost_label
@onready var fuel_cost_label: Label = %fuel_cost_label
signal build_button_pressed
var internal_name

func display(building:Building):
	self.name = building.building_name
	internal_name = self.name
	texture_rect.texture_normal = building.icon
	texture_rect.texture_hover = building.icon_hover
	building_name_label.text = building.building_name
	texture_rect.scale = Vector2(1.25,1.25)
	trash_cost_label.text = str(building.trash_cost)
	if CurrencySingleton.global_trash < building.trash_cost:
		trash_cost_label.set("theme_override_colors/font_color", Color.RED)
	food_cost_label.text = str(building.food_cost)
	if CurrencySingleton.global_food < building.food_cost:
		food_cost_label.set("theme_override_colors/font_color", Color.RED)
	cloth_cost_label.text = str(building.cloth_cost)
	if CurrencySingleton.global_cloth < building.cloth_cost:
		cloth_cost_label.set("theme_override_colors/font_color", Color.RED)
	wood_cost_label.text = str(building.wood_cost)
	if CurrencySingleton.global_wood < building.wood_cost:
		wood_cost_label.set("theme_override_colors/font_color", Color.RED)
	metal_cost_label.text = str(building.metal_cost)
	if CurrencySingleton.global_metal < building.metal_cost:
		metal_cost_label.set("theme_override_colors/font_color", Color.RED)
	elec_cost_label.text = str(building.elec_cost)
	if CurrencySingleton.global_elec < building.elec_cost:
		elec_cost_label.set("theme_override_colors/font_color", Color.RED)
	fuel_cost_label.text = str(building.fuel_cost)
	if CurrencySingleton.global_fuel < building.fuel_cost:
		fuel_cost_label.set("theme_override_colors/font_color", Color.RED)
	pass

func _on_texture_button_pressed():
	emit_signal("build_button_pressed", internal_name)
	pass # Replace with function body.
