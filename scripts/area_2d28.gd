extends Area2D
@onready var anything_2: CharacterBody2D = $".."




func _on_body_entered(body: Node2D) -> void:
	anything_2.queue_free()
	
