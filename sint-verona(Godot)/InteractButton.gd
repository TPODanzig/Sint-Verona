extends Button

@export var ButtonIndex: int


func _ready() -> void:
	global_position = Vector2(get_viewport_rect().size.x / 2 - 100 + ((ButtonIndex - 2) * 250) , 400)


func _on_pressed() -> void:
	GameManager.currentNPC.queue_free()
	GameManager.currentNPC = null
	
	GameManager.TreatedNPCs = GameManager.TreatedNPCs + 1
	
	if (GameManager.ActiveNPCRating == ButtonIndex):
		GameManager.UploadData = true
	else:
		GameManager._WrongChoiceSound()
