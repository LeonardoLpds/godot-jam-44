extends StateNode
class_name AiAttackState

export (NodePath) var idle_state

func process(delta: float) -> StateNode:
	character.velocity.x = 0
	if character.animation_player.is_playing():
		return null
	if character.hitbox.has_target():
		character.animation_player.play("Attack")
		return null
	return get_node(idle_state) as StateNode

func enter() -> void:
	character.animation_player.play("Attack")
