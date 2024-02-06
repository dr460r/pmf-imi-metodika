extends Node2D

var asteroid_scene = preload("res://asteroid/asteroid.tscn")
var ship_scene = preload("res://ship/ship.tscn")
var score = 0
var started = false

func start():
	started = true
	# resetujemo score na 0
	set_score(0)
	# sakrivamo start label
	$StartLabel.visible = false
	# kreiramo brod, postavljamo ga na pocetnu poziciju i povezujemo signal
	var ship = ship_scene.instantiate()
	ship.position = Vector2(100, 270)
	ship.destroyed.connect(end)
	add_child(ship)
	# start asteroid spawn timer
	$AsteroidTimer.start()
	
func end():
	started = false
	$AsteroidTimer.stop() # zaustavljamo tajmer za kreiranje asteroida
	$StartLabel.visible = true # prikazujemo start label
	
func add_score():
	set_score(score + 1)
	
func set_score(value):
	score = value
	$ScoreLabel.text = "Score: " + str(score)

func spawn_asteroid():
	var asteroid = asteroid_scene.instantiate()
	asteroid.position = Vector2(randi() % 160 + 20, -20)
	asteroid.point_gained.connect(add_score)
	add_child(asteroid)

func _unhandled_input(event):
	if not started and Input.is_action_pressed("ui_accept"):
		start()
	
