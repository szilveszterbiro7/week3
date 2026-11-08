extends CanvasLayer


var flash=false
var flash_timer=0.0
var run_time=0.0

@onready var red_flash = $RedFlash
@onready var run_text=$RunText

func _ready():
	red_flash.modulate.a = 0.0
func _process(delta):
	if GameManager.escape and GameManager.time>7.5:
		run_text.show()
	else:
		run_text.hide()
	if GameManager.escape:
		flash_timer+=delta
		if flash_timer>=0.6:
			flash_timer=0.0
			if red_flash.modulate.a==0.0:
				red_flash.modulate.a=0.25
			else:
				red_flash.modulate.a=0.0
	else:
		red_flash.modulate.a=0.0
		flash_timer=0.0
