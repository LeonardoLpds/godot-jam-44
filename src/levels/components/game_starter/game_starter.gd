extends Node2D

onready var animation_player := $AnimationPlayer

var player: KinematicBody2D

func _ready() -> void:
	animation_player.play("Idle")
