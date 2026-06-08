extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var collision_shape_2d: CollisionShape2D = $"shawrma lahme/CollisionShape2D"
@onready var collision_shape_2d_2: CollisionShape2D = $"shawrma phrakh/CollisionShape2D2"
@onready var collision_shape_2d_3: CollisionShape2D = $"shawrma sjk/CollisionShape2D3"



const speed = 40
var moving = false
var dead = false
var collision_locked := false
func _ready():
	await get_tree().create_timer(12.0).timeout
	moving = true

func die():
	if dead:
		return

	dead = true
	moving = false
	animated_sprite_2d.play("dead")
	collision_layer = 0
	collision_mask = 0
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(delta: float) -> void:
	if moving:
		position.x += speed * delta

func _on_body_entered(body: Node2D) -> void:
		moving = false
		animated_sprite_2d.play("attack")
		await get_tree().create_timer(1.3).timeout
		collision_shape_2d.set_deferred("disabled", false)

		await get_tree().create_timer(1.3).timeout
		collision_shape_2d_2.set_deferred("disabled", false)

		await get_tree().create_timer(1.2).timeout
		collision_shape_2d_3.set_deferred("disabled", false)
