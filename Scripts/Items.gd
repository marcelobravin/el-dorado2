extends Area2D


func _ready():
	pass


func _on_items_body_entered(body: Node):
	$anim.play("collected")

func _on_anim_animation_finished(anim_name):
	if anim_name == "collected":
		queue_free()
