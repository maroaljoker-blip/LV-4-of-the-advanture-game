
extends CharacterBody2D

@onready var anything_20: CharacterBody2D = $"../anything 20"


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const speed = -0.406
var moving = true
var activated = false

func _process(delta):
	if moving:
		position.x += speed * delta

	if !activated and !is_instance_valid(anything_20):
		activated = true

		await get_tree().create_timer(1.7).timeout

		collision_shape_2d.set_deferred("disabled", false)
