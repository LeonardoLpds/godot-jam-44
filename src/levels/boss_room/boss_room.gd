extends Node2D

onready var animation_player := $AnimationPlayer

func _ready() -> void:
	animation_player.play("Start")

func _on_boss_death() -> void:
	animation_player.play("Finish")
