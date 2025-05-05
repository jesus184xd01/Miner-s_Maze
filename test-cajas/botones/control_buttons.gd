class_name Control_buttons
extends Button

# diccionario con claves llamadas exactamente que los nodos de los botones
# y en valores, los nombres de los metodos correspondientes
var functions := {
	"pause_button": "nada",
	"play_button": "nada",
	"return_button": "return_level",
	"settings_button": "nada",
	"sound_button": "volume_sound",
	"music_button": "volume_music",
	"voice_mute_button": "nada",
	"home_button": "scene_start",
	"list_button": "scene_select",
	"next_button": "scene_new_level",
	"x_button": "nada",
	"backsong_button": "back_song",
	"nextsong_button": "next_song"
}
var scene_sonido

func _ready() -> void:
	# instancia de nodo sonido
	scene_sonido = preload(GLOBAL.scene_sonido_selec_menu).instantiate()
	scene_sonido.volume_linear = (GLOBAL.volume_sound) / 100
	add_child(scene_sonido)	

func _on_pressed() -> void:
	"""
	Cada vez que es presionado alguno de los botones en el diccionario
	llama a un metodo en base al nombre del boton
	"""
	var name_button = self.name
	# verificar si el nombre del botón está en el diccionario
	if functions.has(name_button):
		var function_name = functions[name_button]
		if has_method(function_name):
			call(function_name)
		else:
			print("no esta el metodo: ", function_name)
	else:
		print("no hay boton: ", name_button)

func disabled_pause():
	if get_tree().paused:
		get_tree().paused = false

# acciones específicas
func return_level() -> void:
	disabled_pause()
	get_tree().reload_current_scene()

func scene_options() -> void:
	return
	
func scene_start() -> void:
	disabled_pause()
	get_tree().change_scene_to_file(GLOBAL.scene_start)
	
func scene_select() -> void:
	disabled_pause()
	get_tree().change_scene_to_file(GLOBAL.scene_select_level)

func scene_new_level():
	get_tree().change_scene_to_file(GLOBAL.new_scene_level())
	
func back_song():
	if GLOBAL.music_instantiate:
		if GLOBAL.num_song > 1:
			GLOBAL.num_song -= 1
		else:
			GLOBAL.num_song = GLOBAL.songs.size()
		
		GLOBAL.music_path = GLOBAL.songs[GLOBAL.num_song - 1]
		GLOBAL.music_instantiate.stream = load(GLOBAL.music_path)
		GLOBAL.music_instantiate.play()
	
func next_song():
	if GLOBAL.music_instantiate:
		if GLOBAL.num_song < GLOBAL.songs.size():
			GLOBAL.num_song += 1
		else:
			GLOBAL.num_song = 1
		
		GLOBAL.music_path = GLOBAL.songs[GLOBAL.num_song - 1]
		GLOBAL.music_instantiate.stream = load(GLOBAL.music_path)
		GLOBAL.music_instantiate.play()
