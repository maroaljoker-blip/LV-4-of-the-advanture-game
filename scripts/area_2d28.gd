extends Area2D
@onready var anything_20: CharacterBody2D = $".."






func _on_body_entered(body: Node2D) -> void:
	anything_20.queue_free()
