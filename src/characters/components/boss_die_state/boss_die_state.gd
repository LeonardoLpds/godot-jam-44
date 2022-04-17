extends StateNode
class_name BossDieState

var explosion_scene := preload("res://src/vfx/particles_explosion/particles_explosion.tscn")
var explosion_counts := 0

func process(delta: float) -> StateNode:
	var explosion = explosion_scene.instance()
	explosion.global_position = character.global_position
	explosion.global_position.y -= 13
	get_tree().current_scene.add_child(explosion)
	yield(explosion, "tree_exited")
	explosion_counts += 1
	if explosion_counts > 50:
		character.queue_free()
	return null
	
func enter() -> void:
	character.hitbox.disabled = true
	character.hurtbox.disabled = true
	character.animation_player.play("Die")
	explosion_counts = 0
