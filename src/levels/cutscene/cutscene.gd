extends CanvasLayer

onready var animation_player := $AnimationPlayer

func enter() -> void:
	animation_player.play("Enter")

func exit() -> void:
	animation_player.play_backwards("Enter")
