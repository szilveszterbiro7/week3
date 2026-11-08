extends Area2D


var player_nearby=false

@onready var dialogue_manager=get_node("/root/Room1/CanvasLayer")

func _process(_delta):
	if player_nearby and not dialogue_manager.dialogue_active:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Scenes/corridor.tscn")
func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		player_nearby=true
func _on_body_exited(body: Node2D) -> void:
	if body.name=="Player":
		player_nearby=false
