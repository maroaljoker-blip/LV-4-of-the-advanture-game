extends Area2D

var lives := 3
var can_take_hit := true

@onready var player: CharacterBody2D = $"../Player"
@onready var label: Label = $Label



func _ready():
	update_label()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "anything 20" or body.name == "anything 10" or body.name == "anything 30":

		if not can_take_hit:
			return

		can_take_hit = false

		lives -= 1
		print("Hit from:", body.name)
		print("Lives:", lives)

		update_label()

		if lives <= 0:
			player.die()
			await get_tree().create_timer(1.0).timeout
			get_tree().reload_current_scene()
			return

		await get_tree().create_timer(0.4).timeout
		can_take_hit = true

func update_label():
	label.text = "Lives: " + str(lives)
