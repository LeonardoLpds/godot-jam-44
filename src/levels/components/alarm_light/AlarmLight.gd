extends Sprite

onready var light := $Light2D

func _physics_process(delta: float) -> void:
	light.rotation_degrees += 3
