class_name Ship
extends Node2D

signal destroyed

# učitaćemo informacije iz scene kao objekat, i kasnije ga možemo pretvoriti u Node i instancirati
var rocket_scene = preload("res://rocket/rocket.tscn")
var speed = 150

func destroy():
	destroyed.emit()
	queue_free()

# funkcija vraća smer kretanja po x osi u zavisnosti od inputa igrača
# ukoliko su pritisnuti dugmići i za levo i za desno kretanje će se anulirati
func calc_direction():
	var dir = Vector2.ZERO
	dir.x += 1 if Input.is_action_pressed("ui_right") else 0
	dir.x += -1 if Input.is_action_pressed("ui_left") else 0
	return dir

func fire():
	# od objekta koji predstavlja rocket scenu kreiramo stablo čvorova ...
	# ... sa root čvorom kao nosiocem cele te strukture
	# u promenljivoj rocket čuvamo referencu na novokreirani root čvor tog stabla
	var rocket = rocket_scene.instantiate()
	rocket.position = position + Vector2(0, -20) # postavljamo početnu poziciju rakete malo iznad broda
	add_sibling(rocket)	# dodajemo raketu u igru, tj. u stablo gde se nalazi i brod tako da imaju isti parent čvor

func _process(delta):
	var direction = calc_direction() # dobijamo smer kretanja u zavisnosti od inputa igrača
	translate(direction * speed * delta) # pomeramo brod u željenom smeru
	
# ova ugrađena funkcija se poziva svaki put kada igrač pritisne bilo koje dugme
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"): # ukoliko je pritisnuto dugme zapravo space ili enter ...
		fire()	# ... ispaljujemo raketu
