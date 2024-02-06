class_name Ship
extends Node2D

signal destroyed

var rocket_scene = preload("res://rocket/rocket.tscn")
var speed = 150

func destroy():
	destroyed.emit()
	queue_free()

func calc_direction():
	var dir = Vector2.ZERO
	dir.x += 1 if Input.is_action_pressed("ui_right") else 0
	dir.x += -1 if Input.is_action_pressed("ui_left") else 0
	return dir

func fire():
	var rocket = rocket_scene.instantiate()
	rocket.position = position + Vector2(0, -20)
	add_sibling(rocket)

func _process(delta):
	var direction = calc_direction()
	translate(direction * speed * delta)
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		fire()
