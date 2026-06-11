extends Node2D
func _ready():
	await get_tree().create_timer(116).timeout
	get_tree().change_scene_to_file("res://scripts/game_5.tscn")
