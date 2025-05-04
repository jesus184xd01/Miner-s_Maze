class_name Personaje
extends CharacterBody2D

@export var espera: float
@onready var animated_sprite = $animated
@export var speed: int

var horizontal: int = 0
var vertical: int = 0

func _physics_process(delta: float) -> void:
	"""
	En cada frame ejecuta el movimiento del personaje y de la caja
	en caso de haber colisionado con alguna.
	"""
	# velocidad de la caja despues de colisionar con el pj
	var vel_coll = mov_pj(delta)
	mov_box(vel_coll)
	
func points(caja: Node2D):
	"""
	Comprueba que en algun punto rojo este posicionado encima de alguna caja
	para mandar una señal de activacion o desactivacion.
	"""
	var objetivos = get_tree().get_nodes_in_group("points")
	for objetivo in objetivos:
		if objetivo.position == caja.position:
			if not objetivo.stat_act:
				objetivo.emit_signal("p_activate")
				objetivo.stat_act = true
		else:
			# desactivar si no está encima
			if objetivo.stat_act:
				objetivo.emit_signal("p_desactivate")
				objetivo.stat_act = false

func mov_pj(delta: float) -> Object:
	"""
	Registro y ejecucion del movimiento del pj al presionarse alguna de las teclas: a, w, s, d.
	Ejecucion de las animaciones a cada movimiento.
	
	Retorna:
		Objeto "CharacterBody2D"
	"""
	
	velocity = Vector2.ZERO
		
	if Input.is_action_pressed("derecha"):
		velocity = Vector2.RIGHT
		animated_sprite.play("right")
	elif Input.is_action_pressed("izquierda"):
		velocity = Vector2.LEFT
		animated_sprite.play("left")
	elif Input.is_action_pressed("arriba"):
		velocity = Vector2.UP
		animated_sprite.play("up")
	elif Input.is_action_pressed("abajo"):
		velocity = Vector2.DOWN
		animated_sprite.play("idle")
	else:
		animated_sprite.play("idle")
	
	var vel_coll = move_and_collide(velocity * speed * delta)
	
	return vel_coll
	
func mov_box(vel_coll):
	"""
	Registra el movimiento de la caja en caso de haber.
	Llama al metodo de push proveniente de la clase Brown_box para empujar la caja.
	Al mismo tiempo llama al metodo de points de la clase actual.
	"""
	if vel_coll:
		var node = vel_coll.get_collider()
		if node is CharacterBody2D:
			node.push(velocity)
			# CONNECT_ONE_SHOT: desactiva la conexion entre la señal y la funcion
			# cuando es usada una sola vez
			node.mov_finish.connect(func(): points(node), CONNECT_ONE_SHOT)
