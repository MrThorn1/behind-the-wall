extends Area2D
@export var rat_scene: PackedScene
@export var rat_quantity : int = 1
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_rats()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Spawn_Rat"):
		rat_quantity = managerpopulation.ref.get_population()
		print(rat_quantity)
		spawn_rats()
	pass

func spawn_rats() -> void:
	var frame_start = randi_range(0,4)
	for i in rat_quantity:
		print(".")
		var rat = rat_scene.instantiate()
		add_sibling.call_deferred(rat)
		rat.global_position = self.global_position
		await get_tree().create_timer(.05).timeout
#		$rat/CharacterBody2D/AnimatedSprite2D.set_frame(frame_start)
	pass
