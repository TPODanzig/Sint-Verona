extends Button

var player_id: String
var save_path := "user://player_id.save"


func _ready() -> void:
	global_position = Vector2(get_viewport_rect().size.x / 2 - 100, 400)
	if FileAccess.file_exists(save_path):
		var f = FileAccess.open(save_path, FileAccess.READ)
		player_id = f.get_line()
		f.close()
	else:
		player_id = str(Time.get_unix_time_from_system()) + "-" + str(randi())
		var f = FileAccess.open(save_path, FileAccess.WRITE)
		f.store_line(player_id)
		f.close()


func _on_pressed() -> void:
	GameManager.currentNPC.queue_free()
	GameManager.currentNPC = null
	
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
