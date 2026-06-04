extends CharacterBody2D
const speed = -0.29


func _process(delta: float) -> void:
	position.x += -speed * delta
