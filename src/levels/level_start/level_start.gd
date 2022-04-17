extends Node2D

var notification_scene := preload("res://src/characters/components/notification/notification.tscn")
var press_x_scene := preload("res://src/characters/components/press_x/press_x.tscn")

onready var press_x := press_x_scene.instance()

onready var player := $Player
onready var animation_player := $AnimationPlayer
onready var npcs := $Npcs

export (PackedScene) var next_scene: PackedScene

var can_start: bool

func _ready() -> void:
	animation_player.play("Idle")
	MusicPlayer.start()

func _unhandled_input(event: InputEvent) -> void:
	if can_start and event.is_action("ui_attack"):
		MusicPlayer.game()
		player.remove_child(press_x)
		can_start = false
		player.animation_player.stop()
		animation_player.play("Start")

func _on_player_entered(body: Node) -> void:
	player.add_child(press_x)
	can_start = true

func _on_player_exited(body: Node) -> void:
	player.remove_child(press_x)
	can_start = false

func load_next_scene():
	get_tree().change_scene_to(next_scene)

func alert():
	for npc in npcs.get_children():
		npc.add_child(notification_scene.instance())
