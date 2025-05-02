class_name Title_label
extends Label

var alpha := 0.0  # opacidad inicial (invisible)
var float_direction := 1
var original_position := Vector2()

func _ready():
	# guardar la posición inicial
	original_position = position
	modulate.a = 0.0

func _process(delta):
	# aumentar opacidad hasta 1
	if alpha < 1.0:
		alpha += delta * 0.5  # vel de aparición
		alpha = clamp(alpha, 0.0, 1.0)
		modulate.a = alpha

	# mover arriba y abajo suavemente
	var float_speed = 18  # que tan rápido sube/baja
	var float_range = 3   # cuanto sube/baja
	var time = Time.get_ticks_msec() / 1000.0
	position.y = original_position.y + sin(time * float_speed) * float_range
