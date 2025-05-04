class_name Global_game
extends Node

const levels = ["res://Niveles/level_1.tscn", "res://Niveles/level_2.tscn", "res://Niveles/level_3.tscn", "res://proximamente/proximamente.tscn"]
const scene_win = "res://Juego/interfaz_win.tscn"
const scene_lose = "res://Juego/interfaz_lose.tscn"
const scene_prox = "res://proximamente/proximamente.tscn"
const scene_pause = "res://Juego/interfaz_settings.tscn"
const scene_start = "res://Juego/interfaz_inicio.tscn"
const scene_select_level = "res://Juego/interfaz_menu_seleccion_niveles.tscn"

#musica y sonido
const scene_background_music = "res://Audio/background_music.tscn"
const scene_sonido_selec_menu = "res://Audio/Sonido_SelecMenu.tscn"
var music_path = "res://musica/A Sweet Smile - Yu-Peng Chen.mp3"
var music_instantiate: AudioStreamPlayer
var sound_instantiate: AudioStreamPlayer
var volume_sound: float = 50
var volume_music: float = 50

# captura de los segs
var timer: int
var capture_time: int
const time_initial = 1000

# actualizar el nivel desde el game_controller
var actual_level: int = 1

func aument_level():
	if (actual_level + 1) <= levels.size():
		actual_level += 1

func escene_level() -> String:
	# restar uno para coincidir respecto al indice
	return levels[actual_level-1]
	
func new_scene_level() -> String:
	aument_level()
	# valor -1 para coincidir respecto al indice del nivel siguiente
	return levels[actual_level - 1]
