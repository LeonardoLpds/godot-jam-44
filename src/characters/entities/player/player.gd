extends KinematicBody2D
class_name Player

onready var sprite := $Sprite
onready var state_machine := $StateMachine
onready var animation_player := $AnimationPlayer
onready var hitbox := $Hitbox
onready var die_state := $StateMachine/DieState
onready var camera := $Camera2D
onready var afk_state := $StateMachine/AFK
onready var idle_state := $StateMachine/IdleState

export (int) var camera_limit_left := -10000000
export (int) var camera_limit_top := -10000000
export (int) var camera_limit_right := 10000000
export (int) var camera_limit_bottom := 10000000
export (bool) var game_mode := true

var velocity = Vector2.ZERO

func _ready() -> void:
	state_machine.init(self)
	camera.limit_left = camera_limit_left
	camera.limit_top = camera_limit_top
	camera.limit_right = camera_limit_right
	camera.limit_bottom = camera_limit_bottom
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.handled_input(event)

func _physics_process(delta: float) -> void:
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if x_input != 0 and state_machine.current_state != afk_state:
		sprite.flip_h = x_input > 0
		hitbox.rotation_degrees = 180 if x_input > 0 else 0
		
	state_machine.process(delta)

func _on_hurt(area: Area2D) -> void:
	state_machine.change_state(die_state)

func enter_afk():
	state_machine.change_state(afk_state)

func exit_afk():
	state_machine.change_state(idle_state)
