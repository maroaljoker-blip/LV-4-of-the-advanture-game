extends Area2D

var lives := 3
var can_take_hit := true

@onready var player_3: CharacterBody2D = $"../../player 3"


@onready var label: Label = $Label


func _ready():
	update_label()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Sin" or body.name == "Cos" or body.name == "Tan" or body.name == "PH" or body.name == "HP" or body.name == "PHP" or body.name == "Neno" : 

		if not can_take_hit:
			return

		can_take_hit = false

		if body.name == "Neno":
			lives -= 2
		else:
			lives -= 1

		print("Hit from:", body.name)
		print("Lives:", lives)

		update_label()

		if lives <= 0:
			player_3.die()
			await get_tree().create_timer(1.0).timeout
			get_tree().reload_current_scene()
			return

		can_take_hit = true

func update_label():
	label.text = "Lives: " + str(lives)

	
