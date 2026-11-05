extends CharacterBody2D


@export_category("Stats")
@export var speed : int = 400
@onready var animated_sprite = $AnimatedSprite2D

var move_direction:  Vector2=Vector2.ZERO

func _physics_process(_delta: float) -> void:
	movement_loop()

func movement_loop() -> void:
	move_direction.x = int(Input.is_action_pressed ("right")) - int(Input.is_action_pressed ("left"))
	move_direction.y = int(Input.is_action_pressed ("down")) - int(Input.is_action_pressed ("up"))
	var motion: Vector2=move_direction.normalized() * speed
	if move_direction==Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
		
	set_velocity(motion)
	move_and_slide()
