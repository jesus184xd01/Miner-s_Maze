class_name Interfaz_proximamente
extends Control

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file(GLOBAL.scene_start)
