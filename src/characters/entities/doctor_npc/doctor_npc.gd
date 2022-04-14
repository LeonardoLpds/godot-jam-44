extends KinematicBody2D

export (Texture) var texture
export (bool) var flip_h := false setget flip

onready var sprite := $Sprite
onready var animation_player := $AnimationPlayer

func _ready() -> void:
	animation_player.play("Idle")
	sprite.flip_h = flip_h
	if texture:
		sprite.texture = texture
		

func flip(value: bool) -> void:
	if sprite:
		flip_h = value
		sprite.flip_h = flip_h
