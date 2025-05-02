class_name PJ
extends CharacterBody2D

@export var espera = 0.5
@export var vel = 64 / espera

var puede_mover = true

# delta == 0.0116 segundos (aprox 60 fps) esto depende del ordenador que lo ejecute
func _physics_process(delta: float) -> void:
	
	var horizontal = Input.get_axis("izquierda", "derecha") #valor negativo si se registra la primera y positivo si la segunda
	var vertical = Input.get_axis("arriba", "abajo") #valor negativo si se registra la primera y positivo si la segunda

	# verificar el mmov. y el tiempo
	if puede_mover and horizontal != 0 or puede_mover and vertical != 0:
		mover(horizontal, vertical, delta)
		puede_mover = false
		await get_tree().create_timer(espera).timeout
		puede_mover = true
	
func mover(horizontal, vertical, delta):
	# mov. suave con delta y velocidad
	position += Vector2(horizontal, vertical) * 64
	# redondear posición
	position = position.round()
	
	# recalcula la posicion segun su vel.
	move_and_slide()
	
