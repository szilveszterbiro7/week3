extends CanvasLayer

@onready var panel=$Panel
@onready var dialogue_label=$Panel/MarginContainer/Label

var dialogue_active=false

func _ready():
	panel.hide()
func show_dialogue(message: String):
	dialogue_label.text=message
	panel.show()
	dialogue_active=true
func hide_dialogue():
	panel.hide()
	dialogue_active=false
func _process(_delta):
	if dialogue_active and Input.is_action_just_pressed("interact"):
		hide_dialogue()
