extends CanvasLayer


@onready var background=$Background
@onready var title=$Title
@onready var close_button=$CloseButton
@onready var paper=$Paper
@onready var letter=$Letter
@onready var letter_close=$Letter/LetterClose
@onready var key=$Key
@onready var dialogue_manager=("/root/Room1/Canvaslayer")

var inspect_active=false

func _ready():
	hide()
	close_button.pressed.connect(close_inspection)
	paper.pressed.connect(read_paper)
	letter.hide()
	letter_close.pressed.connect(close_letter)
	key.pressed.connect(collect_key)
func open_inspection():
	show()
	inspect_active=true
	if GameManager.has_key:
		key.hide()
func close_inspection():
	letter.hide()
	hide()
	inspect_active=false
func _process(_delta):
	if inspect_active and Input.is_action_just_pressed("ui_cancel"):
		if letter.visible:
			close_letter()
		else:
			close_inspection()
func read_paper():
	letter.show()
func close_letter():
	letter.hide()
func collect_key():
	if not GameManager.has_key:
		GameManager.has_key=true
		key.hide()
		close_inspection()
		print("You picked up the caretakers key")
