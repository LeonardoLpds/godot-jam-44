extends Node2D

onready var tween := $Tween
onready var sprite := $Sprite

func _draw() -> void:
	tween.interpolate_property(sprite, "frame", 2, 3, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.3)
	tween.start()
