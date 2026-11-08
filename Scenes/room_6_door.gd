extends Area2D


@onready var dialogue_manager=get_node("../CanvasLayer")

var player_nearby=false

func _process(_delta):
	if player_nearby and not dialogue_manager.dialogue_active:
		if Input.is_action_just_pressed("interact"):
			if GameManager.has_key:
				get_tree().change_scene_to_file("res://Scenes/room_6.tscn")
			else:
				dialogue_manager.show_dialogue("The door is locked...")
func _on_body_entered(body):
	if body.name=="Player":
		player_nearby=true
func _on_body_exited(body):
	if body.name=="Player":
		player_nearby=false
	
