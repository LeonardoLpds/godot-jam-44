extends StateNode
class_name IdleState

export (NodePath) var move_state
export (NodePath) var jump_state

func handled_input(event: InputEvent) -> StateNode:
	if Input.is_action_just_pressed("ui_up"):
		return get_node(jump_state) as StateNode
	return null

func process(delta: float) -> StateNode:
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		return get_node(move_state) as StateNode
	return null

func enter() -> void:
	print("Enter Idle")
