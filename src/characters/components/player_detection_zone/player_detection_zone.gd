extends Area2D

var _player: KinematicBody2D = null

func is_player_in_range() -> bool:
	return _player != null

func get_player() -> KinematicBody2D:
	return _player

func _on_player_entered(body: Node) -> void:
	print("Player Enter")
	_player = body

func _on_player_exited(body: Node) -> void:
	print("Player Exite")
	_player = null
