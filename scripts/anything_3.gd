extends CharacterBody2D

@onready var anything: CharacterBody2D = $"../anything"

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const speed = -0.29

var moving = true
var activated = false

func _ready():
	collision_shape_2d.set_deferred("disabled", true)

func _process(delta):
	if moving:
		position.x += speed * delta

	if !activated and !is_instance_valid(anything):
		activated = true

		print("Previous body disappeared")

		await get_tree().create_timer(1.7).timeout

		print("Collision enabled")

		collision_shape_2d.set_deferred("disabled", false)
