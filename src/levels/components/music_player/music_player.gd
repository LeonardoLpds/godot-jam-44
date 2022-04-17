extends AudioStreamPlayer

var start_bgm = preload("res://assets/sounds/start.ogg")
var game_bgm = preload("res://assets/sounds/bgm.ogg")
var boss_bgm = preload("res://assets/sounds/boss.ogg")
var harp_bgm = preload("res://assets/sounds/harp_loop.ogg")

func start() -> void:
	volume_db = 1
	_start_play(start_bgm)

func game() -> void:
	volume_db = 1
	_start_play(game_bgm)

func boss() -> void:
	volume_db = 1
	_start_play(boss_bgm)

func harp() -> void:
	volume_db = 20
	_start_play(harp_bgm)

func _start_play(music: AudioStream) -> void:
	if stream != music or !is_playing():
		self.stream = music
		play()
