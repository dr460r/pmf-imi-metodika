class_name Rocket
extends Node2D

var speed = 250

func _process(delta):
	var direction = Vector2(0, -1)
	translate(direction * speed * delta)

func destroy():
	queue_free()
