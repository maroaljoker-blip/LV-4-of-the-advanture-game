extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "player 2":

		# Shadow left: only on screen
		for s in get_tree().get_nodes_in_group("shadow left"):
			var notifier = s.get_node_or_null("VisibleOnScreenNotifier2D")
			if notifier == null or notifier.is_on_screen():
				s.die()

		# Skeletons left: wait 1 second, only on screen
		await get_tree().create_timer(1.0).timeout

		for s in get_tree().get_nodes_in_group("skeletons left"):
			var notifier = s.get_node_or_null("VisibleOnScreenNotifier2D")
			if notifier == null or notifier.is_on_screen():
				s.die()
