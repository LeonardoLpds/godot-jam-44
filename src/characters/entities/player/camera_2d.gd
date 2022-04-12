extends Camera2D

func _ready():
	_auto_set_limits()

func _auto_set_limits():
	limit_left = 0
	limit_right = 0
	limit_bottom = 0
	limit_top = 0
	
	var tilemaps = get_tree().get_nodes_in_group("tilemap")
	for tilemap in tilemaps:
		if tilemap is TileMap:
			var used = tilemap.get_used_rect()
			limit_left = int(min(used.position.x * tilemap.cell_size.x, limit_left))
			limit_right = int(max(used.end.x * tilemap.cell_size.x, limit_right))
			limit_bottom = int(max(used.end.y * tilemap.cell_size.y, limit_bottom))
			limit_top = int(min(used.position.y * tilemap.cell_size.y, limit_top))
