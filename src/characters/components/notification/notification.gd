extends Node2D

onready var sprite := $Sprite
onready var tween := $Tween


func _ready() -> void:
	tween.interpolate_property(sprite, "position", Vector2(0, -36), Vector2(0, -40), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property(sprite, "modulate:a", 1, 0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.5)
	tween.start()

func _on_completed() -> void:
	queue_free()
