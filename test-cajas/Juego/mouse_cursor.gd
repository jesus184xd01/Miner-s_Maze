class_name mouse_cursor
extends Node

var cross_cursor = resize_image("res://imgs/decoracion/tile_0028.png", 2)

func _ready() -> void:
	# dimensiones de las imgs: 16 x 16, el click es en el centro
	Input.set_custom_mouse_cursor(cross_cursor, Input.CURSOR_ARROW)

# escalar la img a un mayor tamaño
func resize_image(image_path, scale) -> ImageTexture:
	var image = load(image_path).get_image()
	image.resize(image.get_width() * scale, image.get_height() * scale, Image.INTERPOLATE_NEAREST)
	var texture = ImageTexture.create_from_image(image)
	
	return texture
