extends Label

# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	text = "000" + String(Global.fruits)
	if Global.fruits >= 10:
		text = "000" + String(Global.fruits)