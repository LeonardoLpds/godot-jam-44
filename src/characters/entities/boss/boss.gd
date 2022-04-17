extends KinematicBody2D
class_name Boss

onready var state_machine := $StateMachine
onready var fragile_state := $StateMachine/BossFragileState
onready var die_state := $StateMachine/BossDieState
onready var afk_state := $StateMachine/AFK
onready var jump_state := $StateMachine/BossJumpState
onready var animation_player := $AnimationPlayer
onready var hearts := $Hearts
onready var hitbox := $Hitbox/CollisionShape2D
onready var hurtbox := $Hurtbox/CollisionShape2D
onready var gravity := $Gravity

var velocity = Vector2.ZERO
onready var sprite := $Sprite

func _ready() -> void:
	state_machine.init(self)
	sprite.modulate = Color.white
	gravity.gravity_force = 0

func _physics_process(delta: float) -> void:
	if velocity.x != 0:
		sprite.flip_h = velocity.x > 0
		hearts.rotation_degrees = 0 if velocity.x < 0 else -90

	state_machine.process(delta)

func _on_hurt(area: Area2D) -> void:
	fragile_state.got_hurt()

func enter_afk():
	state_machine.change_state(afk_state)

func exit_afk():
	gravity.gravity_force = 1000
	state_machine.change_state(jump_state)

func death() -> void:
	state_machine.change_state(die_state)
