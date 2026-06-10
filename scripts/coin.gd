extends Area2D

var fall_speed = 30
var moving = false

@onready var manager = get_node("../../manager")

func _ready():
	await get_tree().create_timer(12.0).timeout
	moving = true

func _process(delta):
	if moving:
		position.y += fall_speed * delta

func _on_body_entered(body: Node2D) -> void:
	manager.add_point()
	queue_free()
