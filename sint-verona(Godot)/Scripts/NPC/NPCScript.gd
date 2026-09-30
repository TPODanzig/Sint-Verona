class_name NPCScript
extends Node2D

var ThisNPCRating

var grievance

func _ready() -> void:
	global_position = get_viewport_rect().size / 2. - Vector2(32, 32)
	

func _process(delta: float) -> void:
	if ThisNPCRating != GameManager.ActiveNPCRating:
		
		grievance = {
			(GameManager.ActiveNPCRating == 1): "My leg got torn off",
			(GameManager.ActiveNPCRating == 2): "I inhaled a lot of smoke, and now I have trouble breathing",
			(GameManager.ActiveNPCRating == 3): "I have a cold"
		}[true]
		
		ThisNPCRating = GameManager.ActiveNPCRating 
		_textChange()

func _textChange():
	GameManager.NPCDialogue.text = grievance
