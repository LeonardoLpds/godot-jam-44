extends StateNode
class_name AiIdleState

export (NodePath) var chase_state

func process(delta: float) -> StateNode:
	character.velocity.x = 0
	if character.player_detection.is_player_in_range():
		return get_node(chase_state) as StateNode
	return null

func enter() -> void:
	character.animation_player.play("Idle")
