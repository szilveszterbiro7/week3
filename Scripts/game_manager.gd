extends Node

var has_key=false
var bell_rung=false
var escape=false
var time=10.0

@onready var sound= AudioStreamPlayer.new()

func _ready():
	add_child(sound)
	sound.stream=preload("res://Sounds/chase.wav")
	sound.volume_db=-8.0
func _process(delta):
	if escape:
		time-=delta
		print ("Time left: ", snapped(time, 0.1))
		if time<=0:
			sound.stop()
			escape=false
			time=0
			get_tree().call_deferred(
		"change_scene_to_file",
		"res://Scenes/caught_ending.tscn"
	)
func start_escape():
	escape=true
	time=10.0
	sound.play()
