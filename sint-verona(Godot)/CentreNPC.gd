extends ColorRect

func _ready() -> void:
	global_position = get_viewport_rect().size / 2. - Vector2(32, 32)
