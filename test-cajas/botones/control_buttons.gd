class_name Control_buttons
extends Button

# diccionario con claves llamadas exactamente que los nodos de los botones
# y en valores, los nombres de los metodos correspondientes
var functions := {
	"pause_button": "scene_pause",
	"play_button": "_ir_a_nivel_1",
	"return_button": "return_level",
	"settings_button": "scene_settings",
	"voice_button": "_ir_a_nivel_1",
	"voice_mute_button": "_ir_a_nivel_1",
	"home_button": "scene_start",
	"list_button": "scene_select",
	"next_button": "scene_new_level",
}

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

# acciones específicas
func return_level() -> void:
	get_tree().reload_current_scene()

func scene_settings() -> void:
	get_tree().change_scene_to_file(GLOBAL.scene_prox)
	
func scene_pause() -> void:
	get_tree().change_scene_to_file(GLOBAL.scene_prox)

func scene_start() -> void:
	get_tree().change_scene_to_file(GLOBAL.scene_start)
	
func scene_select() -> void:
	get_tree().change_scene_to_file(GLOBAL.scene_select_level)

func scene_new_level():
	get_tree().change_scene_to_file(GLOBAL.new_scene_level())
