extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var alpha: CharacterBody2D = $alpha
@onready var beta: CharacterBody2D = $beta
@onready var theta: CharacterBody2D = $theta


@onready var collision_shape_2d: CollisionShape2D = $alpha/CollisionShape2D
@onready var collision_shape_2d_2: CollisionShape2D = $beta/CollisionShape2D2
@onready var collision_shape_2d_3: CollisionShape2D = $theta/CollisionShape2D3

const speed = 30
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
	alpha.collision_layer = 8
	alpha.collision_mask = 8
	beta.collision_layer = 8
	beta.collision_mask = 8
	theta.collision_layer = 8
	theta.collision_mask = 8
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(delta: float) -> void:
	if moving:
		position.x += speed * delta

func _on_body_entered(body: Node2D) -> void:
		moving = false
		animated_sprite_2d.play("attack")
		await get_tree().create_timer(1).timeout
		collision_shape_2d.set_deferred("disabled", false)

		await get_tree().create_timer(1.3).timeout
		collision_shape_2d_2.set_deferred("disabled", false)

		await get_tree().create_timer(1.2).timeout
		collision_shape_2d_3.set_deferred("disabled", false)
