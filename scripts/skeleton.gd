extends Node2D
@onready var area_2d: Area2D = $Area2D


const speed = -50
var moving = true
func _process(delta: float) -> void:
	position.x += -speed * delta


func _on_body_entered(body: Node2D) -> void:
	moving = false
