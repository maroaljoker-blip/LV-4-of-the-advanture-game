extends Area2D
@onready var anything_3: CharacterBody2D = $".."




func _on_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(3.6).timeout
	anything_3.queue_free()
