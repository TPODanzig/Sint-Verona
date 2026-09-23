extends Button


func _ready() -> void:
	global_position = get_viewport_rect().size / 2. - Vector2(100, 50)


func _on_pressed() -> void:
	GameManager.TreatedNPCs = 0
	GameManager.CorrectChoices = 0
	GameManager.EndGame = false
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
