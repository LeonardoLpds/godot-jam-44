extends Node2D

onready var animation_player := $AnimationPlayer

export (bool) var enable := true
export (bool) var start_open := false
export (PackedScene) var next_scene: PackedScene

var player: KinematicBody2D

func _ready() -> void:
	if start_open:
		animation_player.play_backwards("Open")

func _unhandled_input(event: InputEvent) -> void:
	if player and event.is_action("ui_attack") and next_scene:
		get_tree().paused = true
		# Yield the transation
		get_tree().paused = false
		get_tree().change_scene_to(next_scene)

func _on_player_entered(body: Node) -> void:
	if enable:
		player = body
		animation_player.play("Open")

func _on_player_exited(body: Node) -> void:
	if enable:
		player = null
		animation_player.play_backwards("Open")
