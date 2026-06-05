extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		for s in get_tree().get_nodes_in_group("skeletons right"):
			s.die()
