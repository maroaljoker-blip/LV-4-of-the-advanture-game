extends Node2D


func _ready():
	await get_tree().create_timer(42.0).timeout
	get_tree().change_scene_to_file("res://scripts/game.tscn")
