extends StateNode
class_name BossDieState

onready var explosion_sound := $ExplosionSound

var explosion_scene := preload("res://src/vfx/particles_explosion/particles_explosion.tscn")
var explosion_counts := 0

func process(delta: float) -> StateNode:
	var explosion = explosion_scene.instance()
	explosion.play_sound = false
	explosion.global_position = character.global_position
	get_tree().current_scene.add_child(explosion)
	explosion.global_position.y -= 13
	explosion_counts += 1
	if explosion_counts > 25:
		character.queue_free()
	return null
	
func enter() -> void:
	self.remove_child(explosion_sound)
	get_tree().current_scene.add_child(explosion_sound)
	explosion_sound.stream.set("loop", false)
	explosion_sound.play()
	character.hitbox.disabled = true
	character.hurtbox.disabled = true
	character.animation_player.play("Die")
	explosion_counts = 0
