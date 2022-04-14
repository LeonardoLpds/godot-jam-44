extends Sprite

onready var light := $Light2D

export (bool) var on := true setget turn_on

func _ready() -> void:
	if on:
		light.enabled = true
	else:
		light.enabled = false

func _physics_process(delta: float) -> void:
	light.rotation_degrees += 3

func turn_on(value: bool) -> void:
	if light:
		on = value
		light.enabled = value
