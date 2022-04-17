extends StateNode
class_name BossJumpState

onready var player := get_tree().current_scene.get_node("Player")
onready var stomp_sound := $StompSound

export (NodePath) var fragile_state

var jump_force := 400
var speed := 88
var jumps_make := 0

func process(delta: float) -> StateNode:
	if character.is_on_wall():
		self.speed = -speed
	character.velocity.x = speed

	if character.velocity.y > 0.0:
		character.animation_player.play("Fall")
	else:
		character.animation_player.play("Jump")	
	
	if character.is_on_floor():
		stomp_sound.stream.set("loop", false)
		stomp_sound.play()
		jumps_make += 1
		player.camera.shake()
		character.velocity.y = -jump_force
	
	if jumps_make > 3:
		return get_node(fragile_state) as StateNode

	return null

func enter() -> void:
	jumps_make = 0
	character.velocity.y = -jump_force

	if character.sprite.flip_h:
		speed = abs(speed)
	else:
		speed = -abs(speed)

	character.animation_player.play("Jump")
