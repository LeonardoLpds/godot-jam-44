extends StateNode
class_name BossIdleState

func process(delta: float) -> StateNode:
	return null

func enter() -> void:
	character.animation_player.play("Idle 2")
