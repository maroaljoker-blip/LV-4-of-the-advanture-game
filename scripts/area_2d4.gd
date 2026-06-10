extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "player 2":
		await get_tree().create_timer(1.0).timeout

		for s in get_tree().get_nodes_in_group("skeletons left"):
			
			var notifier = s.get_node("VisibleOnScreenNotifier2D")
			
			if notifier.is_on_screen():
				s.die()
