extends Area2D


var player_nearby=false

func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Scenes/room_1.tscn")
func _on_body_entered(body):
	if body.name=="Player":
		player_nearby=true
func _on_body_exited(body):
	if body.name=="Player":
		player_nearby=false
