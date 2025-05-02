class_name interfaz
extends CanvasLayer

# escenas de los niveles
@onready var level_label = $HBoxContainer2/LevelLabel
@onready var time_label = $HBoxContainer2/TimeLabel
@onready var pushes_label = $HBoxContainer2/PushesLabel

func _ready() -> void:
	level_label.text = "Level "+ str(GLOBAL.actual_level)

func _on_game_controller_time_updated(seconds_left: Variant) -> void:
	time_label.text = "TIME: " + str(seconds_left)

func _on_pj_detect_pushes(pushes: Variant) -> void:
	pushes_label.text = "PUSHES: " + str(pushes)

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(GLOBAL.scene_select_level)
