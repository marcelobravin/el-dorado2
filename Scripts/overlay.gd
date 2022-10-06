extends ColorRect

var progress = .0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	material.set("shader_param/progress", progress)
