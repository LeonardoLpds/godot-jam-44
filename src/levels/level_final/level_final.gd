extends Node2D

var press_x_scene := preload("res://src/characters/components/press_x/press_x.tscn")

onready var press_x := press_x_scene.instance()
onready var player := $Player
onready var bed := $Bed
onready var animation_player := $AnimationPlayer

var can_start: bool

func _unhandled_input(event: InputEvent) -> void:
	if can_start and event.is_action("ui_attack"):
		player.remove_child(press_x)
		can_start = false
		animation_player.play("End")

func _on_player_entered(body: Node) -> void:
	player.add_child(press_x)
	can_start = true

func _on_player_exited(body: Node) -> void:
	player.remove_child(press_x)
	can_start = false
