extends Area2D

@export var limit_left := 1000
@export var limit_right := 1200

func _on_CamBorder_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var camera := body.get_node("Camera2D") as Camera2D
		if camera:
			camera.limit_left = limit_left
			camera.limit_right = limit_right

func _on_CamBorder_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		var camera := body.get_node("Camera2D") as Camera2D
		if camera:
			# Optional: zurück auf Standardwerte setzen
			camera.limit_left = 0
			camera.limit_right = 5000
