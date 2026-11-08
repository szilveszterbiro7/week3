extends Area2D


var player_nearby=false

@onready var dialogue_manager=get_node("../CanvasLayer")

func _process(_delta):
	if player_nearby and not  dialogue_manager.dialogue_active:
		if Input.is_action_just_pressed("interact"):
			if GameManager.escape:
				GameManager.escape = false
				GameManager.sound.stop()
				get_tree().change_scene_to_file("res://Scenes/escape_ending.tscn")
			else:
				dialogue_manager.show_dialogue("I can't leave yet... Something is keeping me here.")
func _on_body_entered(body):
	if body.name=="Player":
		player_nearby=true
func _on_body_exited(body):
	if body.name=="Player":
		player_nearby=false
