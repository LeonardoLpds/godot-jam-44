extends StateNode
class_name AttackState

export (NodePath) var idle_state

var finished := false
var current_attack := 1
var max_attacks := 3
var can_attack := false

func handled_input(event: InputEvent) -> StateNode:
	if (
		event.is_action_pressed("ui_attack")
		and current_attack < max_attacks
		and can_attack
		and character.is_on_floor()
	):
		can_attack = false
		current_attack += 1
		character.animation_player.play("Attack %s" % current_attack)
	return null

func process(delta: float) -> StateNode:
	if character.animation_player.is_playing():
		return null
	return get_node(idle_state) as StateNode

func enter() -> void:
	can_attack = false
	current_attack = 1 
	if character.is_on_floor():
		character.velocity.x = 0
		character.animation_player.play("Attack %s" % current_attack)
	else:
		character.animation_player.play("Attack Air")

func enable_attack() -> void:
	can_attack = true
