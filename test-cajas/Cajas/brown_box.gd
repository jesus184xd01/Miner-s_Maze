class_name Brown_box
extends CharacterBody2D

signal mov_finish
# contador de empujes
signal detect_pushes

var pushing = false

func push(direction):
	"""
	Parametros: direction indicada con un vector
	
	Verifica si en la caja esta siendo empujada (ejecucion de animacion en curso)
	y verifica antes de mover la caja que haya algun collisionshape en su camino 
	Envia señales para cuando termina la animacion de movimiento y
	otra señal para contabilizar los empujes
	"""
	# detectar si esta siendo empujada (ejecucion de animacion en curso)
	# y verificar que haya un collisionshape estorbando
	if pushing or test_move(transform, direction * 64):
		return
	pushing = true
	# instanciar objeto de animaciones para la caja
	var tween = create_tween()
	
	tween.tween_property(
		self, "position",
		position + direction * 64,
		# segs. duracion
		0.5
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.finished.connect(func():
		pushing = false
		emit_signal("mov_finish")
		)
	# llamar a pushes de game_controller
	emit_signal("detect_pushes")
