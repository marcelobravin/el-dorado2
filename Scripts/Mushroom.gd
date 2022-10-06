extends enemy_base

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
