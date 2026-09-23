extends Node2D

@export var NPCLooks: Array[PackedScene] = [
	preload("res://tri.tscn"),
	preload("res://circ.tscn"),
	preload("res://sqar.tscn")
]

var NPCRating: Array[int] = [
	1,
	2,
	3
]


func _process(delta: float) -> void:
	if GameManager.currentNPC == null:
		_spawnNPC()


func _spawnNPC() -> void:
	var NPC = NPCLooks[randf_range(0, len(NPCLooks))].instantiate()
	GameManager.currentNPC = NPC
	add_child(NPC)
	GameManager.ActiveNPCRating = NPCRating[randf_range(0, len(NPCRating))]
