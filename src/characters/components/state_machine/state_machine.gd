extends Node
class_name StateMachine

export (NodePath) var starting_state

var current_state: StateNode

func init(character: KinematicBody2D) -> void:
	for child in get_children():
		child.character = character
	change_state(get_node(starting_state))

func process(delta: float) -> void:
	change_state(current_state.process(delta))

func handled_input(event: InputEvent) -> void:
	change_state(current_state.handled_input(event))

func change_state(new_state: StateNode) -> void:
	if new_state is StateNode and new_state != current_state:
		if current_state is StateNode:
			current_state.exit()
		current_state = new_state
		current_state.enter()
