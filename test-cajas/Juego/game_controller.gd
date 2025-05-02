class_name GameController
extends Node2D

# precargar escena del fin
@onready var scene_lose = preload(GLOBAL.scene_lose)
@onready var interfaz_juego = $"../interfaz"

signal time_updated(seconds_left)

# segundos de margen (16 min. aprox.)
var time_initial = GLOBAL.time_initial
var tot_push = 0

func _ready():
	var cajas = get_tree().get_nodes_in_group("cajas")
	for caja in cajas:
		caja.detect_pushes.connect(_on_any_box)

func _on_any_box():
	tot_push += 1
	interfaz_juego._on_pj_detect_pushes(tot_push)
	
func _on_timer_timeout() -> void:
	if time_initial > 0:
		time_initial -= 1
	else:
		# agregar scena de lose
		add_child(scene_lose.instantiate())
	
	GLOBAL.timer = time_initial
	# señal de los segs restantes
	time_updated.emit(time_initial)
