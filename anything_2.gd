extends CharacterBody2D
const speed = -0.29


var moving = true

func _process(delta: float) -> void:
	if moving:
		position.x += speed * delta
