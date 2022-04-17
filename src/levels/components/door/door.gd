extends Node2D



export (bool) var enable := true
export (bool) var start_open := false
export (bool) var quit := false
export (String, FILE) var next_scene: String

var press_x_scene := preload("res://src/characters/components/press_x/press_x.tscn")
var player: KinematicBody2D

onready var s = load(next_scene) if next_scene else null
onready var animation_player := $AnimationPlayer
onready var press_x := press_x_scene.instance()


func _ready() -> void:
	if start_open:
		animation_player.play_backwards("Open")

func _unhandled_input(event: InputEvent) -> void:
	if player and event.is_action("ui_attack"):
		if next_scene:
			get_tree().paused = true
			# Yield the transation
			get_tree().paused = false
			get_tree().change_scene_to(s)
		elif quit:
			get_tree().quit()

func _on_player_entered(body: Node) -> void:
	if enable:
		player = body
		player.add_child(press_x)
		animation_player.play("Open")

func _on_player_exited(body: Node) -> void:
	if enable:
		player.remove_child(press_x)
		player = null
		animation_player.play_backwards("Open")
