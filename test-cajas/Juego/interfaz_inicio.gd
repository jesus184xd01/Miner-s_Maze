class_name Interfaz_inicio
extends Control



func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file(GLOBAL.scene_select_level)


func _on_selec_pressed() -> void:
	get_tree().change_scene_to_file(GLOBAL.scene_prox)


func _on_options_pressed() -> void:
	var scene_options_inst = preload(GLOBAL.scene_options).instantiate()
	add_child(scene_options_inst)
	# realizar una pausa global
	get_tree().paused = true
