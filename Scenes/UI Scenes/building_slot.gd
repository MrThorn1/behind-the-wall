extends PanelContainer

@onready var texture_rect: TextureRect = %TextureRect

func display(building:Building):
	texture_rect.texture = building.icon
	pass
