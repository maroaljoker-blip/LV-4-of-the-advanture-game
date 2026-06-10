extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var neno_collision: CollisionShape2D = $Neno/CollisionShape2D

var speed = 17.0
var moving = false

func _ready():
	await get_tree().create_timer(1).timeout
	moving = true

func _process(delta):
	if moving:
		position.x += speed * delta

func _on_body_entered(body: Node2D) -> void:
	moving = false
	animated_sprite_2d.play("idle")

	await get_tree().create_timer(1.0).timeout
	animated_sprite_2d.play("jump")

	await get_tree().create_timer(1.0).timeout
	animated_sprite_2d.play("fall")

	await get_tree().create_timer(1.0).timeout

	# Move upward a little after 3 seconds total
	position.y -= 110

	animated_sprite_2d_2.play("bolt")
	await get_tree().create_timer(0.1).timeout
	neno_collision.set_deferred("disabled", false)
