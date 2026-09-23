extends Button

@export var ButtonIndex: int


func _ready() -> void:
	global_position = Vector2(get_viewport_rect().size.x / 2 - 100 + ((ButtonIndex - 2) * 250) , 400)

func _process(delta: float) -> void:
		if (GameManager.EndGame == true):
			global_position = Vector2(get_viewport_rect().size.x / 2 - 100, 400)
			text = "Back to menu"

func _on_pressed() -> void:
	if (GameManager.EndGame == true):
		get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
		
	else:
		GameManager.currentNPC.queue_free()
		GameManager.currentNPC = null
		
		GameManager.TreatedNPCs = GameManager.TreatedNPCs + 1
		
		if (GameManager.ActiveNPCRating == ButtonIndex):
			GameManager._CorrectChoiceSound()
			GameManager.UploadData = true
			GameManager.CorrectChoices = GameManager.CorrectChoices + 1
		else:
			GameManager._WrongChoiceSound()
