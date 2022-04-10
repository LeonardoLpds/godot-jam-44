extends KinematicBody2D
class_name Player

onready var sprite = $Sprite
onready var state_machine := $StateMachine

var velocity = Vector2.ZERO

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.handled_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process(delta)
