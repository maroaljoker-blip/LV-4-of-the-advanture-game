extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const speed = -25
var moving = false
var dead = false

func _ready():
	await get_tree().create_timer(12.0).timeout
	moving = true

func die():
	if dead:
		return

	dead = true
	moving = false
	animated_sprite_2d.play("dead")

	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(delta: float) -> void:
	if moving:
		position.x += speed * delta

func _on_body_entered(body: Node2D) -> void:
	moving = false
	animated_sprite_2d.play("attack")
