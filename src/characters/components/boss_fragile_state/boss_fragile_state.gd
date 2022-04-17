extends StateNode
class_name BossFragileState

var explosion_scene := preload("res://src/vfx/particles_explosion/particles_explosion.tscn")

onready var timer := $Timer

export (NodePath) var jump_state

var timer_duration := 1.5
var time_finished := false

func process(delta: float) -> StateNode:
	if time_finished:
		return get_node(jump_state) as StateNode
	return null

func enter() -> void:
	character.hitbox.disabled = true
	character.hurtbox.disabled = false
	time_finished = false
	timer.start(timer_duration)
	character.velocity = Vector2.ZERO
	character.animation_player.play("Fragile")
	character.hearts.visible = true

func exit() -> void:
	character.hitbox.disabled = false
	character.hurtbox.disabled = true
	character.hearts.visible = false

func got_hurt() -> void:
	timer.stop()
	var explosion = explosion_scene.instance()
	explosion.position.y -= 13
	character.add_child(explosion)
	character.hurtbox.set_deferred("disabled", true)
	var heart = character.hearts.get_child(0)
	heart.destroy()
	yield(heart, "tree_exited")
	if character.hearts.get_child_count() <= 0:
		character.death()
	else:
		time_finished = true

func _on_timer_timeout() -> void:
	time_finished = true
