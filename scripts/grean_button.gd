extends Area2D


var hits = 0

@onready var player: CharacterBody2D = $"../Player"

func _on_body_entered(body):
	if body.name == "anything2" or body.name == "anything" or body.name == "anything 3":
		hits += 1
		print("Hits:", hits)
		print(body.name)
		if hits >= 3:
			player.die()

			await get_tree().create_timer(1.0).timeout
			get_tree().reload_current_scene()
