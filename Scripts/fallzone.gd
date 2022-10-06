extends Area2D

func _on_fallzone_body_entered(_body: Node):
	var error_code = get_tree().reload_current_scene()
	if error_code != 0:
		print("Error: ", error_code)
