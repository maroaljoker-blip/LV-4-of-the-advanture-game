extends Area2D
@onready var anything_30: CharacterBody2D = $".."


func _on_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(3.5).timeout
	anything_30.queue_free()
