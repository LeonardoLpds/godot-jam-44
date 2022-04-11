extends StateNode
class_name MoveState

export (NodePath) var idle_state
export (NodePath) var jump_state
export (NodePath) var attack_state

var speed := 60

func handled_input(event: InputEvent) -> StateNode:
	if character.is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			return get_node(jump_state) as StateNode
		if Input.is_action_just_pressed("ui_attack"):
			return get_node(attack_state) as StateNode
	return null

func process(delta: float) -> StateNode:
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	character.velocity.x = x_input * speed
	character.velocity = character.move_and_slide_with_snap(character.velocity, Vector2.DOWN, Vector2.UP)
	
	if !character.is_on_floor():
		return get_node(jump_state) as StateNode

	if x_input == 0:
		return get_node(idle_state) as StateNode
	return null


func enter() -> void:
	character.animation_player.play("Run")
