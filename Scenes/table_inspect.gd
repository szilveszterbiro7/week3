extends CanvasLayer


@onready var background=$Background
@onready var title=$Title
@onready var close_button=$CloseButton

var inspect_active=false

func _ready():
	hide()
	close_button.pressed.connect(close_inspection)

func open_inspection():
	show()
	inspect_active=true
func close_inspection():
	hide()
	inspect_active=false
func _process(_delta):
	if inspect_active and Input.is_action_just_pressed("ui_cancel"):
		close_inspection()
