extends Position2D

var target: Node = null

func _on_target_entered(body: Node) -> void:
	target = body

func _on_target_exited(body: Node) -> void:
	target = null

func has_target():
	return target != null
