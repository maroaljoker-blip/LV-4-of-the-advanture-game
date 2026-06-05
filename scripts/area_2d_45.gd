extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		await get_tree().create_timer(1.0).timeout

		for s in get_tree().get_nodes_in_group("skeletons left1.1"):
			s.die()
