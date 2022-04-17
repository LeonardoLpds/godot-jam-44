extends Particles2D

onready var sound := $Sound
export (bool) var play_sound := true

func _ready() -> void:
	if play_sound:
		sound.stream.set("loop", false)
		sound.play()
	emitting = true


func _process(delta: float) -> void:
	if !is_emitting():
		queue_free()
