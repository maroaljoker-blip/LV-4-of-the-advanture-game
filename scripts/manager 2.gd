
extends Node

var score = 0

@onready var coins_label: Label = $"coins label"

func _ready():
	start_timer()

func start_timer():
	await get_tree().create_timer(60.0).timeout

	# If 20 coins were NOT collected in 60 seconds
	if score < 20:
		get_tree().reload_current_scene()

func add_point():
	score += 1
	coins_label.text = str(score) + " $"
	print("+1 coin!")

	
