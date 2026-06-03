extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

const speed = 60

func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("attack")
