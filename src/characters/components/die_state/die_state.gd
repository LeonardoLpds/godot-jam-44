extends StateNode
class_name DieState

func enter() -> void:
	character.velocity.x = 0
	character.set_physics_process(false)
	character.animation_player.play("Die")
