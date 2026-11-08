extends Control


@onready var play_button=$MenuButtons/Play
@onready var exit_button=$MenuButtons/Exit

func _ready():
	play_button.pressed.connect(start_game)
	exit_button.pressed.connect(exit_game)
func start_game():
	GameManager.has_key=false
	GameManager.bell_rung=false
	GameManager.escape=false
	GameManager.time=10.0
	GameManager.sound.stop()
	get_tree().change_scene_to_file("res://Scenes/room_1.tscn")
func exit_game():
	get_tree().quit()
	
