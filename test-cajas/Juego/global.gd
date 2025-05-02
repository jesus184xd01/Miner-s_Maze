class_name Global_game
extends Node

const levels = ["res://Niveles/level_1.tscn", "res://Niveles/level_2.tscn", "res://Niveles/level_3.tscn", "res://proximamente/proximamente.tscn"]
const scene_win = "res://Juego/interfaz_win.tscn"
const scene_lose = "res://Juego/interfaz_lose.tscn"
const scene_prox = "res://proximamente/proximamente.tscn"

const scene_start = "res://Juego/interfaz_inicio.tscn"
const scene_select_level = "res://Juego/interfaz_menu_seleccion_niveles.tscn"

# captura de los segs
var timer: int
var capture_time: int
const time_initial = 1000

# actualizar el nivel desde el game_controller
var actual_level: int = 1

func aument_level():
	if (actual_level + 1) < levels.size():
		actual_level += 1

func escene_level() -> String:
	# restar uno para coincidir respecto al indice
	return levels[actual_level-1]
	
func new_scene_level() -> String:
	# valor exacto para coincidir respecto al indice
	return levels[actual_level]
