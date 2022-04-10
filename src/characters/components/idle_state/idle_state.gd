extends StateNode
class_name IdleState

export (NodePath) var move_state
export (NodePath) var jump_state
export (NodePath) var attack_state
export (bool) var move_by_input := true

func handled_input(event: InputEvent) -> StateNode:
	if character.is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			return get_node(jump_state) as StateNode
		if Input.is_action_just_pressed("ui_attack"):
			return get_node(attack_state) as StateNode
	return null

func process(delta: float) -> StateNode:
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		return get_node(move_state) as StateNode
	
	if !character.is_on_floor():
		return get_node(jump_state) as StateNode

	character.velocity.x = 0
	return null

func enter() -> void:
	character.animation_player.play("Idle")
