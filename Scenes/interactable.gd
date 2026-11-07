extends Area2D


var player_nearby=false

@onready var dialogue_manager=get_node("/root/Room1/CanvasLayer")
@onready var bell=get_node("/root/Room1/Bell")
@onready var inspection=get_node("/root/Room1/Tabletop")

func _process(_delta):
	if player_nearby and not dialogue_manager.dialogue_active and not inspection.inspect_active:
		if Input.is_action_just_pressed("interact"):
			if bell.bell_ring:
				inspection.open_inspection()
			else:
				dialogue_manager.show_dialogue("I should ring the reception bell first.\nPress E to exit.")
func _on_body_entered(body):
	if body.name=="Player":
		player_nearby=true
func _on_body_exited(body):
	if body.name=="Player":
		player_nearby=false
