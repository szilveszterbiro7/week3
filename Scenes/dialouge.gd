extends CanvasLayer

@onready var panel=$Panel
@onready var dialogue_label=$Panel/MarginContainer/Label

var dialogue_active=false
var can_close=false

func _ready():
	panel.hide()
func show_dialogue(message: String):
	dialogue_label.text=message
	panel.show()
	dialogue_active=true
	can_close=false
func hide_dialogue():
	panel.hide()
	dialogue_active=false
func _process(_delta):
	if dialogue_active:
		if not Input.is_action_pressed("interact"):
			can_close = true

		if can_close and Input.is_action_just_pressed("interact"):
			hide_dialogue()
