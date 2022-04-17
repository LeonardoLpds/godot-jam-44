extends Node2D

var press_x_scene := preload("res://src/characters/components/press_x/press_x.tscn")

onready var press_x := press_x_scene.instance()
onready var player := $Player
onready var bed := $Bed
onready var animation_player := $AnimationPlayer

var can_start: bool
var done := false

func _ready() -> void:
	MusicPlayer.harp()

func _unhandled_input(event: InputEvent) -> void:
	if can_start and event.is_action("ui_attack"):
		player.remove_child(press_x)
		can_start = false
		player.animation_player.stop()
		animation_player.play("End")
		done = true

func _on_player_entered(body: Node) -> void:
	if !done:
		player.add_child(press_x)
		can_start = true

func _on_player_exited(body: Node) -> void:
	if !done:
		player.remove_child(press_x)
		can_start = false
