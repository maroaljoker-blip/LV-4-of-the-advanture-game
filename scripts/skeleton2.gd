extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const speed = -50
var moving = true

func _process(delta: float) -> void:
	if moving:
		position.x += speed * delta

func _on_body_entered(body: Node2D) -> void:
	moving = false
	animated_sprite_2d.play("attack")
