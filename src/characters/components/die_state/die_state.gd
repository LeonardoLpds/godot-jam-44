extends StateNode
class_name DieState

func enter() -> void:
	character.velocity.x = 0
	character.set_physics_process(false)
	character.animation_player.play("Die")
	yield(character.animation_player, "animation_finished")
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().reload_current_scene()
