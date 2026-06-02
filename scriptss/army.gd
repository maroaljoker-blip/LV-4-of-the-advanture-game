extends AnimatedSprite2D


const speed = 100

func _process(delta: float) -> void:
	position.x += -speed * delta
