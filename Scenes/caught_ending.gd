extends Control


@onready var play_again = $PlayAgain
@onready var exit_button = $Exit

func _ready():
	play_again.pressed.connect(restart_game)
	exit_button.pressed.connect(exit_game)
func restart_game():
	GameManager.has_key=false
	GameManager.bell_rung=false
	GameManager.escape=false
	GameManager.time=10.0
	GameManager.sound.stop()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
func exit_game():
	get_tree().quit()
