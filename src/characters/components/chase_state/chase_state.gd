extends StateNode
class_name ChaseState

export (NodePath) var idle_state
export (NodePath) var attack_state

func process(delta: float) -> StateNode:
	if !character.player_detection.is_player_in_range():
		return get_node(idle_state) as StateNode
	
	var distance = character.global_position.distance_to(
		character.player_detection.get_player().global_position
	)
	var direction = character.global_position.direction_to(
		character.player_detection.get_player().global_position
	) * 60
	
	if distance < 10:
		direction.x = 0
	
	character.velocity.x = direction.x
	
	if character.hitbox.has_target():
		return get_node(attack_state) as StateNode

	return null

func enter() -> void:
	character.animation_player.play("Run")
