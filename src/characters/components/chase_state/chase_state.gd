extends StateNode
class_name ChaseState

export (NodePath) var idle_state
export (NodePath) var attack_state

func process(delta: float) -> StateNode:
	if !character.player_detection.is_player_in_range():
		return get_node(idle_state) as StateNode
	
	var distance: Vector2 = character.global_position - character.player_detection.get_player().global_position
	var direction := character.global_position.direction_to(
		character.player_detection.get_player().global_position
	) * 60
	
	var abs_x_distance = distance.x if distance.x > 0 else -distance.x
	if abs_x_distance < 10:
		direction.x = 0
	
	character.velocity.x = direction.x
	if character.is_on_wall() and character.is_on_floor():
		character.velocity.y = -270
	
	if character.hitbox.has_target():
		return get_node(attack_state) as StateNode
	
	_play_animations()

	return null

func _play_animations() -> void:
	if character.is_on_floor():
		character.animation_player.play("Run")
		return

	if character.velocity.y < 0:
		character.animation_player.play("Jump")
		return
	character.animation_player.play("Fall")

func enter() -> void:
	character.animation_player.play("Run")
