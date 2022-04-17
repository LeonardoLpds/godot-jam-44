extends Camera2D

onready var shake_timer := $ShakeTimer

var default_offset := Vector2(0, -45)
var amplitude := 4.0
var duration := 0.5
var damp_easing := 1.0
var shake := false

func _ready():
	pass

func _process(delta: float) -> void:
	if !shake: return
	var damping := ease(shake_timer.time_left / shake_timer.wait_time, damp_easing)
	offset = Vector2(
		rand_range(amplitude, -amplitude) * damping,
		(rand_range(amplitude, -amplitude) * damping) + default_offset.y
	)

func shake() -> void:
	shake_timer.start(duration)
	shake = true

func _on_shake_timer_timeout() -> void:
	shake = false
	offset = default_offset
