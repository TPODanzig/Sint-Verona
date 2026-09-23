class_name GameManager
extends Node2D

var player_id: String
var save_path := "user://player_id.save"

static var WrongChoiceSound
static var CorrectChoiceSound

static var currentNPC
static var ActiveNPCRating
static var UploadData = false

static var TreatedNPCs: int = 0
static var CorrectChoices: int = 0
static var EndGame: bool = false

func _ready() -> void:
	WrongChoiceSound = get_child(0)
	CorrectChoiceSound = get_child(1)
	
	if FileAccess.file_exists(save_path):
		var f = FileAccess.open(save_path, FileAccess.READ)
		player_id = f.get_line()
		f.close()
	else:
		player_id = str(Time.get_unix_time_from_system()) + "-" + str(randi())
		var f = FileAccess.open(save_path, FileAccess.WRITE)
		f.store_line(player_id)
		f.close()

func _process(delta: float) -> void:
	if (TreatedNPCs > 4):
		EndGame = true
	
	
	if (UploadData == true):
		_uploadData()
		UploadData = false

func _uploadData():
	var http := HTTPRequest.new()
	add_child(http)
	http.request_completed.connect(_on_request_completed)
	http.request(
		"http://localhost:1922/api/players/%s/click" % player_id,
		[], HTTPClient.METHOD_POST
	)
	
func _on_request_completed(result, code, headers, body):
	var data = JSON.parse_string(body.get_string_from_utf8())
	print("clicks: ", data.clicks)


static func _WrongChoiceSound():
	WrongChoiceSound.play()
	
static func _CorrectChoiceSound():
	CorrectChoiceSound.play()
