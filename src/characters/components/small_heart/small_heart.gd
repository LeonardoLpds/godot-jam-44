extends Node2D

onready var sprite := $AnimatedSprite

func destroy() -> void:
	sprite.play()
	yield(sprite, "animation_finished")
	queue_free()
