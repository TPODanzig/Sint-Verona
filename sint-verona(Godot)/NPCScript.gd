class_name NPCScript
extends Node2D

var ThisNPCRating

func _ready() -> void:
	global_position = get_viewport_rect().size / 2. - Vector2(32, 32)
	

func _process(delta: float) -> void:
	if ThisNPCRating != GameManager.ActiveNPCRating:
		ThisNPCRating = GameManager.ActiveNPCRating 
		_textChange()

func _textChange():
	get_child(0).get_child(0).text = str(ThisNPCRating)
