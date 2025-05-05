class_name Level
extends Node2D

signal captured_time(time_actually)

@onready var load_scene: CanvasLayer = $Load_scene

var scene_win = preload(GLOBAL.scene_win)
var objetivos = []
var cajas = []


func _ready():
	"""
	Obtiene los grupos 'points' y 'cajas' del nivel actual.
	Cada objetivo estara conectado a 2 señales.
	Carga la musica de fondo y sus valores de volumen.
	"""
	load_music()
	
	objetivos = get_tree().get_nodes_in_group("points")
	cajas = get_tree().get_nodes_in_group("cajas")
	print(objetivos)
	print(cajas)
	for objetivo in objetivos:
		objetivo.p_activate.connect(_on_point_p_activate)
		objetivo.p_desactivate.connect(_on_point_p_desactivate)

func load_music():
	var music_inst = preload(GLOBAL.scene_background_music).instantiate()
	music_inst.stream = load(GLOBAL.music_path)
	add_child(music_inst)
	music_inst.volume_linear = (GLOBAL.volume_music) / 100
	GLOBAL.music_instantiate = music_inst
#func adjust_volume(background_music: AudioStreamPlayer):

func winnable():
	"""
	Comprueba que en cada punto u objetivo haya una caja encima de los mismos
	y determinar si ha ganado mostrando una interfaz de winner o no (no haria nada)
	"""
	
	for objetivo in objetivos:
		var hay_caja = false
		
		for caja in cajas:
			# comprueba si la caja esta encima (casi) con un margen de
			# distancia de 1 px
			if caja.global_position.distance_to(objetivo.global_position) < 1:
				hay_caja = true
				break
		if not hay_caja:
			return # aun falta posicionar una o mas cajas
	# registrar el tiempo
	GLOBAL.capture_time = GLOBAL.timer
	# escena de interfaz win
	add_child(scene_win.instantiate())
	print("GANASTE!!")
	

func _on_point_p_activate() -> void:
	print("Punto activado")
	# llama cada vez al metodo para determinar si ha ganado
	winnable()

func _on_point_p_desactivate() -> void:
	print("Punto desactivado")
