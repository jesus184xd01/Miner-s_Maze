# CLASE TEMPORAL
class_name Menu_selection_level
extends Control

func _on_level_1_pressed() -> void:
	GLOBAL.actual_level = 1
	get_tree().change_scene_to_file(GLOBAL.escene_level())


func _on_level_2_pressed() -> void:
	GLOBAL.actual_level = 2
	get_tree().change_scene_to_file(GLOBAL.escene_level())


func _on_level_3_pressed() -> void:
	GLOBAL.actual_level = 3
	get_tree().change_scene_to_file(GLOBAL.escene_level())
