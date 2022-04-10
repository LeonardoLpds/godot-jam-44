extends KinematicBody2D
class_name SpearGuard

onready var sprite := $Sprite
onready var state_machine := $StateMachine
onready var animation_player := $AnimationPlayer
onready var player_detection := $PlayerDetectionZone
onready var hitbox := $Hitbox

var velocity = Vector2.ZERO

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.handled_input(event)

func _physics_process(delta: float) -> void:
	if velocity.x != 0:
		sprite.flip_h = velocity.x > 0
		hitbox.rotation_degrees = 180 if velocity.x > 0 else 0

	state_machine.process(delta)
