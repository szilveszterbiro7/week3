extends Area2D


var player_nearby=false

@onready var dialogue_manager=get_node("/root/Room1/CanvasLayer")

func _process(_delta):
	if player_nearby and not dialogue_manager.dialogue_active:
		if Input.is_action_just_pressed("interact"):
			if not GameManager.bell_rung:
				GameManager.bell_rung=true
				dialogue_manager.show_dialogue("DING! The bell has bing rung...But nobody answers...")
			else: 
				dialogue_manager.show_dialogue("You have already rung the bell.")

func _on_body_entered(body):
	if body.name=="Player":
		player_nearby=true
func _on_body_exited(body):
	if body.name=="Player":
		player_nearby=false
