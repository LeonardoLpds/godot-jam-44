extends AnimatedSprite

onready var beep := $Beep

func alive() -> void:
	set_animation("alive")
	beep.stream.set("loop", false)
	beep.play()


func _on_beep_finished() -> void:
	yield(get_tree().create_timer(1.3), "timeout")
	beep.stream.set("loop", false)
	beep.play()
