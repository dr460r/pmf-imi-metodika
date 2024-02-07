class_name Asteroid
extends Node2D

signal point_gained # okida se kada je potrebno da igrač dobije poen zbog uništenja asteroida

var speed = 100 # brzina kretanja

# funkcija koja se izvrsava ponovo za svaki frame
# delta je proteklo vreme u sekundama od prethodnog frame-a
func _process(delta):
	# pomeraj po Y osi koji zavisi od brzine i delta-e
	var direction = Vector2(0, 1)
	translate(direction * speed * delta)

func destroy():
	queue_free() # iniciranje brisanja ovog objekta
	
func on_collision(area: Area2D):
	var target = area.get_parent() # uzimamo vlasnika HitBox-a sa kojm se asteroid sudario
	# ukoliko raketa pogodila asteroid treba unistiti oba objekta i emitovati signal
	if target is Rocket:
		target.destroy()
		destroy()
		point_gained.emit()
	# ukoliko je asteroid udario brod onda ga treba unistiti
	elif target is Ship:
		target.destroy()
