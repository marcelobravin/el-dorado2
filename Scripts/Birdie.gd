extends enemy_base

func _process(_delta: float) -> void:
	velocity.y = 0
	if $RayCast2D.is_colliding():
		$RayCast2D.scale.x *= -1
		move_direction *= -1
		$AnimationPlayer.play("run")
