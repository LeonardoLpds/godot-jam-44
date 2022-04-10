extends Node
class_name StateNode

var character: KinematicBody2D

func enter() -> void:
	pass

func exit() -> void:
	pass

func process(delta: float) -> StateNode:
	return null

func handled_input(event: InputEvent) -> StateNode:
	return null
