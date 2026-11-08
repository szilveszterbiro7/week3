extends CharacterBody2D


@export_category("Stats")
@export var speed : int = 400
@onready var animated_sprite = $AnimatedSprite2D

var move_direction:  Vector2=Vector2.ZERO
var tabletop = get_node_or_null("../Tabletop")

func _physics_process(_delta: float) -> void:
	movement_loop()

func movement_loop() -> void:
	if tabletop!=null and tabletop.inspect_active:
		velocity=Vector2.ZERO
		move_and_slide()
		return
	move_direction.x = int(Input.is_action_pressed ("right")) - int(Input.is_action_pressed ("left"))
	move_direction.y = int(Input.is_action_pressed ("down")) - int(Input.is_action_pressed ("up"))
	var motion: Vector2=move_direction.normalized() * speed
	if move_direction==Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
		
	set_velocity(motion)
	move_and_slide()
