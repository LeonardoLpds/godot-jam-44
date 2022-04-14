extends StateNode
class_name JumpState

export (NodePath) var move_state
export (NodePath) var idle_state
export (NodePath) var attack_state

var speed := 60
var jump_force = 250

func handled_input(event: InputEvent) -> StateNode:
	if Input.is_action_just_pressed("ui_attack") and character.game_mode:
		return get_node(attack_state) as StateNode
	return null

func process(delta: float) -> StateNode:
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	character.velocity.x = x_input * speed
	
	if Input.is_action_just_released("ui_up") and character.velocity.y < -jump_force/2:
		character.velocity.y = -jump_force/2
	
	character.velocity = character.move_and_slide_with_snap(character.velocity, Vector2.DOWN, Vector2.UP)
	
	if character.velocity.y > 0.0:
		if character.game_mode:
			character.animation_player.play("Fall")
		else:
			character.animation_player.play("Fall 2")

	if character.is_on_floor():
		if x_input != 0:
			return get_node(move_state) as StateNode
		return get_node(idle_state) as StateNode
	return null

func enter() -> void:
	if character.is_on_floor():
		character.velocity.y = -jump_force
	if character.game_mode:
		character.animation_player.play("Jump")
	else:
		character.animation_player.play("Jump 2")
