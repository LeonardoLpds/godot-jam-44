extends KinematicBody2D
class_name Player

onready var sprite := $Sprite
onready var state_machine := $StateMachine
onready var animation_player := $AnimationPlayer

var velocity = Vector2.ZERO

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.handled_input(event)

func _physics_process(delta: float) -> void:
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if x_input != 0:
		sprite.flip_h = x_input > 0
	state_machine.process(delta)
