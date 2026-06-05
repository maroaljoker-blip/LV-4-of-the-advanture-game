extends Area2D
@onready var anything: CharacterBody2D = $".."




func _on_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(1.75).timeout
	anything.queue_free()
