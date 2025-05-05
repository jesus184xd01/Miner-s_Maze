class_name Interfaz_settings
extends Control

@onready var h_scroll_music: HScrollBar = $PcontainerBackgroundPause/MarginAllelements/VMain/PcontainerSounds/MarginContainer/GridCSounds/HScrollMusic
@onready var h_scroll_sound: HScrollBar = $PcontainerBackgroundPause/MarginAllelements/VMain/PcontainerSounds/MarginContainer/GridCSounds/HScrollSound

@onready var percent_music_label: Label = $PcontainerBackgroundPause/MarginAllelements/VMain/PcontainerSounds/MarginContainer/GridCSounds/PercentMusicLabel
@onready var percent_sound_label: Label = $PcontainerBackgroundPause/MarginAllelements/VMain/PcontainerSounds/MarginContainer/GridCSounds/PercentSoundLabel

@onready var music_label: Label = $PcontainerBackgroundPause/MarginAllelements/VMain/PcontainerButtons2/MarginContainer2/HButtons/MusicLabel

func _ready() -> void:
	music_label.text = "Song " + str(GLOBAL.num_song)
	h_scroll_music.value = GLOBAL.volume_music
	h_scroll_sound.value = GLOBAL.volume_sound

func _on_x_button_pressed() -> void:
	"""
	Quita la escena (nodo) de pausa del arbol cuando
	esta presente en el nivel
	"""
	get_tree().paused = false
	queue_free()

func _on_h_scroll_sound_value_changed(value: float) -> void:
	GLOBAL.volume_sound = value
	percent_sound_label.text = str(int(round(value))) + "%"

func _on_h_scroll_music_value_changed(value: float) -> void:
	var round_value = round(value)
	GLOBAL.volume_music = value
	
	if GLOBAL.music_instantiate:
		GLOBAL.music_instantiate.volume_linear = value / 100
	
	percent_music_label.text = str(int(round(value))) + "%"


func _on_backsong_button_pressed() -> void:
	music_label.text = "Song " + str(GLOBAL.num_song)


func _on_nextsong_button_pressed() -> void:
	music_label.text = "Song " + str(GLOBAL.num_song)
