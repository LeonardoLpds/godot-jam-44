extends Node

export(int) var gravity_force := 1200

onready var object: PhysicsBody2D = get_parent()

func _physics_process(delta: float) -> void:
	object.velocity.y += gravity_force * delta
	object.velocity = object.move_and_slide(object.velocity, Vector2.UP)
