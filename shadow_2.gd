extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2

@onready var neno: CharacterBody2D = $Neno
@onready var collision_shape_2d: CollisionShape2D = $Neno/CollisionShape2D



var speed = -30.0
var moving = false
var dead = false
func _ready():
	await get_tree().create_timer(15).timeout
	moving = true

func die():
	if dead:
		return

	dead = true 
	moving = false
	neno.collision_mask = 7
	neno.collision_layer = 7
	animated_sprite_2d.play("dead")
	await get_tree().create_timer(1).timeout
	queue_free()
	


func _process(delta):
	if moving:
		position.x += speed * delta

func _on_body_entered(body: Node2D) -> void:
	if dead:
		return

	moving = false
	animated_sprite_2d.play("idle")

	await get_tree().create_timer(1.0).timeout
	if dead:
		return

	animated_sprite_2d.play("jump")

	await get_tree().create_timer(1.0).timeout
	if dead:
		return

	animated_sprite_2d.play("fall")

	await get_tree().create_timer(1.0).timeout
	if dead:
		return

	for i in range(110):
		position.y -= 1
		await get_tree().create_timer(0.01).timeout
		if dead:
			return

	animated_sprite_2d_2.play("bolt")

	await get_tree().create_timer(1.0).timeout
	if dead:
		return

	collision_shape_2d.set_deferred("disabled", false)
