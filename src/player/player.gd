extends KinematicBody2D
class_name Player

onready var sprite = $Sprite

var gravity := 1200.0
var max_speed := 100
var acceleration := 1500
var friction := 0.2
var velocity := Vector2.ZERO
var jump_force = 350

func _physics_process(delta: float) -> void:
	# SGravity
	velocity.y += gravity * delta

	# Input
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if x_input != 0:
		sprite.flip_h = x_input > 0
		velocity.x += x_input * (acceleration * delta)
		velocity.x = clamp(velocity.x, -max_speed, max_speed)

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -jump_force
		if x_input == 0:
			velocity.x = lerp(velocity.x, 0, friction)
	else:
		if Input.is_action_just_released("ui_up") and velocity.y < -jump_force/2:
			velocity.y = -jump_force/2
		if x_input == 0:
			velocity.x = lerp(velocity.x, 0, 0.02)

	velocity = move_and_slide(velocity, Vector2.UP)
