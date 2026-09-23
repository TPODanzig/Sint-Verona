extends Node2D

var WinText

@export var NPCLooks: Array[PackedScene] = [
	preload("res://Prefabs/tri.tscn"),
	preload("res://Prefabs/circ.tscn"),
	preload("res://Prefabs/sqar.tscn")
]

var NPCRating: Array[int] = [
	1,
	2,
	3
]

func _ready() -> void:
	WinText = get_child(0)
	WinText.size = get_viewport_rect().size
	WinText.text = ""

func _process(delta: float) -> void:
	if GameManager.currentNPC == null && GameManager.TreatedNPCs < 5:
		_spawnNPC()
	
	if GameManager.EndGame == true :
		WinText.text = "You got " + str(GameManager.CorrectChoices) + "/5 choices correct!!!"


func _spawnNPC() -> void:
	var NPC = NPCLooks[randf_range(0, len(NPCLooks))].instantiate()
	GameManager.currentNPC = NPC
	add_child(NPC)
	GameManager.ActiveNPCRating = NPCRating[randf_range(0, len(NPCRating))]
