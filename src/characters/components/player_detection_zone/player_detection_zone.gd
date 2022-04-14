extends Area2D

var _notification := preload("res://src/characters/components/notification/notification.tscn")
var _player: KinematicBody2D = null

func is_player_in_range() -> bool:
	return _player != null

func get_player() -> KinematicBody2D:
	return _player

func _on_player_entered(body: Node) -> void:
	get_parent().add_child(_notification.instance())
	_player = body

func _on_player_exited(body: Node) -> void:
	_player = null
