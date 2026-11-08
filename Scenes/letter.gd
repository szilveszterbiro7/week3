extends Area2D


var player_nearby=false
var letter_read=false

@onready var dialogue_manager=get_node("../CanvasLayer")
@onready var shadow=get_node("../Shadow")

func _process(_delta):
	if player_nearby and not letter_read:
		if Input.is_action_just_pressed("interact"):
			letter_read=true
			dialogue_manager.show_dialogue("You shouldn't have entered...\nYou are not the last guest...")
			GameManager.start_escape()
			shadow.show()
func _on_body_entered(body):
	if body.name=="Player":
		player_nearby=true
func _on_body_exited(body):
	if body.name=="Player":
		player_nearby=false
