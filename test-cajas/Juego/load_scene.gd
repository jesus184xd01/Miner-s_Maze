class_name Load_scene
extends CanvasLayer

@onready var background_color: ColorRect = $background_color
@onready var animation_fade: AnimationPlayer = $background_color/Animation_Fade

func _ready() -> void:
	background_color.visible = true
	await (animation_fade.animation_finished)
	# elimina el nodo actual (principal en este caso)
	queue_free()
