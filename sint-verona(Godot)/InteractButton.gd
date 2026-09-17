extends Button


func _ready() -> void:
	global_position = Vector2(get_viewport_rect().size.x / 2 - 100, 400)


func _on_pressed() -> void:
	GameManager.currentNPC.queue_free()
	GameManager.currentNPC = null
