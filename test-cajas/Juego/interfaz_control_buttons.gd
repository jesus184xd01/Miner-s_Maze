class_name Interfaz_control_buttons
extends Control

@onready var btn_left = $left
@onready var btn_right = $right
@onready var btn_top = $top
@onready var btn_down = $down

# funcion que cambia la opacidad de la textura del boton
func changue_opacity(texture_button: CanvasItem):
	texture_button.modulate.a = 0.5
	
func restore_opacity(texture_button: CanvasItem):
	texture_button.modulate.a = 1

func _on_left_pressed() -> void:
	changue_opacity(btn_left)

func _on_left_released() -> void:
	restore_opacity(btn_left)

func _on_right_pressed() -> void:
	changue_opacity(btn_right)

func _on_right_released() -> void:
	restore_opacity(btn_right)


func _on_top_pressed() -> void:
	changue_opacity(btn_top)


func _on_top_released() -> void:
	restore_opacity(btn_top)


func _on_down_pressed() -> void:
	changue_opacity(btn_down)


func _on_down_released() -> void:
	restore_opacity(btn_down)
