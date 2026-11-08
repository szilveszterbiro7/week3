extends Node

var has_key=false
var bell_rung=false
var escape=false
var time=10.0

func _process(delta):
	if escape:
		time-=delta
		print ("Time left: ", snapped(time, 0.1))
		if time<=0:
			escape=false
			time=0
			print("TIME IS UP! The Last Guest caught you!")
func start_escape():
	escape=true
	time=10.0
