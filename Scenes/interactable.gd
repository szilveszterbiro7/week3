extends Area2D


@export_multiline var txt: String="There is something wrong with this table..."

var player_nearby=false

@onready var dialogue_manager=get_node("/root/Room1/UI")

func _process(_delta):
	if player_nearby and not dialogue_manager.dialogue_active:
		if Input.is_action_just_pressed("interact"):
			dialogue_manager.show_dialogue(txt)
func _on_body_entered(body):
	if body.name=="Player":
		player_nearby=true
func _on_body_exited(body):
	if body.name=="Player":
		player_nearby=false
